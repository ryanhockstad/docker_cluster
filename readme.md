What do you need?
* docker.  You should probably give it like 16 gigs of ram because we're running a 3 node cluster with kibana and enterprise search.  

How to get this stuff running:

 Step 0: Copy the example.env to .env. Change the name of the last line to your public IP if you want to access enterprise search from the World Wide Web.

 Step 0.5: run `docker network create local_esnet`

 Step 1: run `./setup.sh`

 Step 2: There are no more steps.

 Step 3: Log in to kibana (with https), type 'thisisunsafe' because the ca authority isn't trusted by your browser.
 
 Step 4: log in with user 'enterprise_search' and password 'password' if you want to play with enterprise search
        Otherwise, log in with user 'elastaic' adn password 'password'

 Step 5: Delete everything by running `./teardown.sh`



TODO stuff
* PKI for kibana
Get CN from kibana certificate to use with Role Mapping for RBAC:
`openssl x509 -noout -subject -in certs/kibana/kibana.crt`
