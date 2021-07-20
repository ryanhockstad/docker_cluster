#!/bin/bash

./bin/elasticsearch-certutil ca --pem --pass changeme --out ./bindmount/elastic-stack-ca.zip
unzip ./bindmount/elastic-stack-ca.zip -d /certs

./bin/elasticsearch-certutil cert --ca-cert /certs/ca/ca.crt --ca-key /certs/ca/ca.key \
--ca-pass changeme --in ./bindmount/instances/instances.yml --pem --pass password --out ./bindmount/bundle.zip
unzip ./bindmount/bundle.zip -d /certs; 

./bin/elasticsearch-certutil cert --ca-cert /certs/ca/ca.crt --ca-key /certs/ca/ca.key \
--ca-pass changeme --in ./bindmount/instances/logstash.yml --pass "${LOG_PASS}" --out ./bindmount/logstash.zip
unzip ./bindmount/logstash.zip -d /certs

./jdk/bin/keytool -importkeystore -srckeystore /certs/logstash/logstash.p12 -srcstoretype pkcs12 \
-destkeystore /certs/logstash/logstash_key.jks -deststoretype jks << ANSWERS
$LOG_PASS
$LOG_PASS
$LOG_PASS
ANSWERS