docker-compose down --remove-orphans
docker container rm create_certs

rm -rf example_data/data
rm -rf example_data/sincedb

docker volume rm es_certs es_local_es1_data es_local_es2_data es_nginx_logs es_kibana_config