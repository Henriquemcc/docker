#!/bin/bash

# Creating GitLab data folder
mkdir -p "/srv/gitlab/config:/etc/gitlab" "/srv/gitlab/logs:/var/log/gitlab" "/srv/gitlab/data:/var/opt/gitlab"

# Stopping GitLab
docker stop my_gitlab
sudo docker stop my_gitlab

# Removing old GitLab
docker rm my_gitlab
sudo docker rm my_gitlab

# Updating GitLab container
docker-compose up -d || sudo docker-compose up -d

# Starting GitLab
docker start my_gitlab || sudo docker start my_gitlab

# Updating GitLab
docker exec my_gitlab gitlab-ctl upgrade || sudo docker exec my_gitlab gitlab-ctl upgrade

# Checking GitLab config
docker exec my_gitlab gitlab-ctl check-config || sudo docker exec my_gitlab gitlab-ctl check-config

# Starting GitLab
docker exec my_gitlab gitlab-ctl start || sudo docker exec my_gitlab gitlab-ctl start
docker exec my_gitlab gitlab-ruby || sudo docker exec my_gitlab gitlab-ruby