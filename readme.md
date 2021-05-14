How to get this stuff running:
Step 1: run `./setup.sh`
Step 2: There are no more steps.
Step 3: Log in to kibana (with https), type 'thisisunsafe' because the ca authority isn't trusted by your browser, and log in with user 'enterprise_search' and password 'password'
Step 4: Delete everything by running `./teardown.sh`


* PKI for kibana
Get CN from kibana certificate to use with Role Mapping for RBAC:
`openssl x509 -noout -subject -in certs/kibana/kibana.crt`
