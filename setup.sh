#!/bin/bash

# set -o allexport; source .env; set +o allexport
export $(xargs <.env)

if  ! docker volume ls | grep -q es_certs
then
  cp .env initialize/.env
  cd initialize
  docker-compose up
  cd ..
fi



docker-compose up -d --remove-orphans


docker cp node-1:/usr/share/elasticsearch/config/certs/ca/ca.crt .
until curl --cacert ./ca.crt -s -u elastic:$ELASTIC_PASSWORD https://localhost:9200
do
  sleep 0.1
done

sleep 10
docker-compose -f docker.setup.yml -p setup up -d

rm ca.crt