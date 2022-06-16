#!/bin/bash

#set permission for /config
chown -R hotio:hotio /config

su -s /bin/bash hotio  <<EOF
app/orpheusbetter
EOF
