#!/bin/bash

set -e

eval $(ssh-agent -s)
echo "$PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null

./disableHostKeyChecking.sh

DEPLOY_SERVER=`cat deploy-server-ip.txt`

echo "deploying to ${DEPLOY_SERVER}"

ssh ec2-user@{DEPLOY_SERVER} "sudo yum install docker -y && sudo service docker start \
        && sudo docker run --rm -d -p 80:8080 registry.gitlab.com/cursos-repo/lemoncode/cloud/practica-cloud"