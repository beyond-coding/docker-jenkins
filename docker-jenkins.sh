#!/bin/bash

HEADER="Docker jenkins -"

echo "$HEADER in process..."

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CADDY=$DIR/caddy
mkdir -p $CADDY

wget https://raw.githubusercontent.com/beyond-coding/docker-jenkins/master/Caddyfile
cp Caddyfile $CADDY/.
rm Caddyfile

echo "$HEADER starting..."

wget https://raw.githubusercontent.com/beyond-coding/docker-jenkins/master/docker-compose.yml

docker-compose up -d


TIME=30
echo "$HEADER waiting $TIME seconds for the initial admin password to be created."
sleep $TIME

echo "$HEADER show initial admin password."

docker exec -it ubuntu_jenkins cat /var/jenkins_home/secrets/initialAdminPassword

echo "$HEADER done."