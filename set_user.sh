#!/bin/sh

uid=${FLUENT_UID:-1002}

# add the fluent user with $FLUENT_UID
useradd -u ${uid} -o -c "" -m fluent
export HOME=/home/fluent

# chown home and data folder
chown -R 1002 /home/fluent
chown -R 1002 /fluentd

#exec fluent "$@"