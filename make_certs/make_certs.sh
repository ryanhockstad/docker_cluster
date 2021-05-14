#!/bin/bash

./bin/elasticsearch-certutil ca --pem --pass changeme --out ./bindmount/elastic-stack-ca.zip
unzip ./bindmount/elastic-stack-ca.zip -d /certs

./bin/elasticsearch-certutil cert --ca-cert /certs/ca/ca.crt --ca-key /certs/ca/ca.key \
--ca-pass changeme --in ./bindmount/instances.yml --pem --pass password --out ./bindmount/bundle.zip
unzip ./bindmount/bundle.zip -d /certs; 

# chown -R 1000:0 /certs