#!/bin/bash

# Creating GitLab data folder
etc_gitlab_dir="/srv/gitlab/config:/etc/gitlab"
var_log_gitlab_dir="/srv/gitlab/logs:/var/log/gitlab"
var_opt_gitlab_dir="/srv/gitlab/data:/var/opt/gitlab"
mkdir -p "$etc_gitlab_dir" "$var_log_gitlab_dir" "$var_opt_gitlab_dir" || sudo mkdir -p "$etc_gitlab_dir" "$var_log_gitlab_dir" "$var_opt_gitlab_dir"

# Updating GitLab container
docker-compose up -d || sudo docker-compose up -d