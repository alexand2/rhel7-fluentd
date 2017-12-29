#!/bin/sh

uid=${FLUENT_UID:-1002}

# check if a old fluent user exists and delete it
#cat /etc/passwd | grep fluent
#if [ $? -eq 0 ]; then
#    deluser fluent
#fi

# add the fluent user with $FLUENT_UID
useradd -u ${uid} -o -c "" -m fluent
export HOME=/home/fluent

# chown home and data folder
chown -R 1002 /home/fluent
chown -R 1002 /fluentd

#exec fluent "$@"