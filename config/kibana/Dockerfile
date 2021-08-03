ARG VER
FROM docker.elastic.co/kibana/kibana:${VER}
USER kibana
COPY kibana.yml /usr/share/kibana/config/kibana.yml
RUN /usr/share/kibana/bin/kibana-keystore create \
    && /usr/share/kibana/bin/kibana-encryption-keys generate | tail -4 | \
    grep 'xpack.encryptedSavedObjects.encryptionKey:'  | awk '{ print $2}' \
    | bin/kibana-keystore add xpack.encryptedSavedObjects.encryptionKey --stdin 
