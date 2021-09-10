#!/bin/bash

su elasticsearch
bin/elasticsearch-service-tokens create elastic/fleet-server fleet-token | awk '{print $NF}' > config/service_account_token.txt


# User service token to hit API from outside container
# curl --cacert node-1/ca.crt --cert node-1/node-1.crt:password --key node-1/node-1.key -H "Authorization: Bearer <base64_encoded_token>" https://localhost:9200/_cluster/health

/bin/tini -- /usr/local/bin/docker-entrypoint.sh