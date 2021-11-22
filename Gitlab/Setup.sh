#!/bin/bash

# Creating GitLab data folder
sudo mkdir -p "/srv/gitlab/config:/etc/gitlab" "/srv/gitlab/logs:/var/log/gitlab" "/srv/gitlab/data:/var/opt/gitlab"

# Stopping GitLab
sudo docker stop my_gitlab

# Removing old GitLab
sudo docker rm my_gitlab

# Updating GitLab container
sudo docker-compose up -d

# Starting GitLab
sudo docker start my_gitlab

# Updating GitLab
sudo docker exec my_gitlab gitlab-ctl upgrade

# Checking GitLab config
sudo docker exec my_gitlab gitlab-ctl check-config

# Starting GitLab
sudo docker exec my_gitlab gitlab-ctl start
sudo docker exec my_gitlab gitlab-ruby


