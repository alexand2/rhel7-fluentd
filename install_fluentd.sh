#!/bin/bash
# add GPG key
rpm --import https://packages.treasuredata.com/GPG-KEY-td-agent

# add treasure data repository to yum
cat >/etc/yum.repos.d/td.repo <<'EOF';
[treasuredata]
name=TreasureData
baseurl=http://packages.treasuredata.com/2/redhat/\$releasever/\$basearch
gpgcheck=1
gpgkey=https://packages.treasuredata.com/GPG-KEY-td-agent
EOF

# update your sources
yum check-update

# install the toolbelt
yes | yum install -y td-agent