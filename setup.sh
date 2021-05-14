#!/bin/bash

if  ! docker volume ls | grep -q es_certs
then
  cd make_certs
  docker-compose up
  cd ..
fi

docker-compose up -d

while ! docker logs enterprise_search 2>&1 | grep password
do
  sleep 5
  echo 'Waiting on enterprise_search container.'
done

enterprise_password=$(docker logs enterprise_search 2>&1 | grep password | awk '{print $2}')
echo $enterprise_password

docker cp node-1:/usr/share/elasticsearch/config/certs/ca/ca.crt .

curl -u enterprise_search:$enterprise_password --cacert ./ca.crt -XPOST \
https://localhost:9200/_security/user/enterprise_search/_password \
-H 'Content-Type: application/json' -d '{"password" : "password"}'

rm ./ca.crt
