#!/bin/bash

# set -o allexport; source .env; set +o allexport
export $(xargs <.env)
docker-compose build

if  ! docker volume ls | grep -q es_certs
then
  cp .env initialize/.env
  cd initialize
  docker-compose up
  cd ..
fi

docker-compose up -d --remove-orphans

docker cp node-1:/usr/share/elasticsearch/config/certs/node-1 .
docker cp node-1:/usr/share/elasticsearch/config/certs/ca/ca.crt ./node-1
until curl --cacert ./node-1/ca.crt --cert ./node-1/node-1.crt:$ELASTIC_KEY_PASSPHRASE --key ./node-1/node-1.key -s -u elastic:$ELASTIC_PASSWORD https://localhost:9200/_cat/indices?v
do
  sleep 0.1
done

sleep 10
docker-compose -f docker.post_install.yml -p post_install up -d

# rm -rf  node-1
# rm -rf ca.crt