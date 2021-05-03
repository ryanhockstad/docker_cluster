Get CN from kibana certificate to use with Role Mapping for RBAC:
`openssl x509 -noout -subject -in certs/kibana/kibana.crt`