#!/bin/bash

# Starting GitLab
docker start my_gitlab || sudo docker start my_gitlab

# Updating gitlab
docker exec my_gitlab gitlab-ctl upgrade || sudo docker exec my_gitlab gitlab-ctl upgrade

# Checking GitLab config
docker exec my_gitlab gitlab-ctl check-config || sudo docker exec my_gitlab gitlab-ctl check-config

# Starting GitLab
docker exec my_gitlab gitlab-ctl start || sudo docker exec my_gitlab gitlab-ctl start
docker exec my_gitlab gitlab-ruby || sudo docker exec my_gitlab gitlab-ruby