What do you need?
* Docker.  You should probably give it like 16 gigs of ram because we're running a 3 node cluster with logstash, filebeat, kibana and enterprise search, and auditbeat.  

How to get this stuff running:

 * Step 0: Copy the example.env to .env. 

 * Step 1: run `./setup.sh`

 * Step 2: There are no more steps.

 * Step 3: Log in to kibana (with https), type 'thisisunsafe' because the ca authority isn't trusted by your browser.
 
 * Step 4: log in with user 'enterprise_search' and password 'changeme' if you want to play with enterprise search.<br> Otherwise, log in with user 'elastic' and password 'changeme'

 * Step 5: Delete everything by running `./teardown.sh`



TODO stuff
* Add elastic agent
* add APM
* PKI for kibana
Get CN from kibana certificate to use with Role Mapping for RBAC:
`openssl x509 -noout -subject -in certs/kibana/kibana.crt`
