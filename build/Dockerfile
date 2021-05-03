FROM docker.elastic.co/elasticsearch/elasticsearch:7.12.0

COPY build/ ./build
# Figure out how to use Dockerfile Secret for --pass argument
RUN ./bin/elasticsearch-certutil ca --pem --pass changeme --out elastic-stack-ca.zip && \
    mkdir config/certs && unzip elastic-stack-ca.zip && rm elastic-stack-ca.zip && mv ca/* config/certs/ && \
    ./bin/elasticsearch-certutil cert --ca-cert ./config/certs/ca.crt --ca-key ./config/certs/ca.key \
    --ca-pass changeme --in instances.yml --pem --pass changeme --out certificate-bundle.zip && \
    unzip certificate-bundle.zip && rm certificate-bundle.zip && mv

# Figure out how to use Dockerfile Secret to assign corresponding keystore passwords
RUN ./bin/elasticsearch-keystore add xpack.security.transport.ssl.secure_key_passphrase changeme
RUN ./bin/elasticsearch-keystore add xpack.security.transport.ssl.truststore.secure_password