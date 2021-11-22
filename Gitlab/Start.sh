#!/bin/bash

# Updating GitLab container
sudo docker-compose up -d

# Starting GitLab
sudo docker start my_gitlab

# Updating gitlab
sudo docker exec my_gitlab gitlab-ctl upgrade

# Checking GitLab config
sudo docker exec my_gitlab gitlab-ctl check-config

# Starting GitLab
sudo docker exec my_gitlab gitlab-ctl start
sudo docker exec my_gitlab gitlab-ruby
