#!/bin/bash

# Creating GitLab data folder
mkdir -p "/srv/gitlab/config:/etc/gitlab" "/srv/gitlab/logs:/var/log/gitlab" "/srv/gitlab/data:/var/opt/gitlab"

# Updating GitLab container
docker-compose up -d || sudo docker-compose up -d