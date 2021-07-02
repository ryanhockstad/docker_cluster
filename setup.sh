#!/bin/bash

# set -o allexport; source .env; set +o allexport
export $(xargs <.env)

if  ! docker volume ls | grep -q es_certs
then
  cd make_certs
  docker-compose up
  cd ..
fi



docker-compose up -d --remove-orphans


docker cp node-1:/usr/share/elasticsearch/config/certs/ca/ca.crt .
until curl --cacert ./ca.crt -s -u elastic:$ELASTIC_PASSWORD https://localhost:9200
do
  sleep 0.1
done
docker-compose -f docker.setup.yml up -d
rm ca.crt