docker-compose down --remove-orphans
docker container rm auditbeat_setup metricbeat_setup
docker network rm es_net

rm -rf example_data/data
rm -rf example_data/sincedb
rm -rf example_data/sincedb_csv
rm -rf node-1


docker volume rm es_certs es_local_es1_data es_local_es2_data es_nginx_logs es_kibana_config