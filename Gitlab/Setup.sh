#!/bin/bash

# Creating GitLab data folder
sudo mkdir -p "/srv/gitlab/config:/etc/gitlab" "/srv/gitlab/logs:/var/log/gitlab" "/srv/gitlab/data:/var/opt/gitlab"

# Running container
sudo docker-compose up -d