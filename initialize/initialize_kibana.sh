#!/bin/bash

./bin/kibana-keystore create
./bin/kibana-encryption-keys generate | tail -4 >> encryption_keys.yml

grep 'xpack.encryptedSavedObjects.encryptionKey:' encryption_keys.txt | awk '{ print $2}' \
| bin/kibana-keystore add 'xpack.encryptedSavedObjects.encryptionKey' --stdin