#!/bin/bash

# Runs this script as root if it is not root.
function run_as_root() {
  if [ "$(whoami)" != "root" ]; then
    echo "This script is not running as root"
    if [ "$(command -v sudo)" ]; then
      sudo bash "$0"
      exit $?
    else
      echo "Sudo is not installed"
      exit 1
    fi
  fi
}

# Running this script as root
run_as_root

# Creating GitLab data folder
mkdir -p "/srv/gitlab/config:/etc/gitlab" "/srv/gitlab/logs:/var/log/gitlab" "/srv/gitlab/data:/var/opt/gitlab"

# Stopping GitLab
docker stop my_gitlab

# Removing old GitLab
docker rm my_gitlab

# Updating GitLab container
docker-compose up -d

# Starting GitLab
docker start my_gitlab

# Updating GitLab
docker exec my_gitlab gitlab-ctl upgrade

# Checking GitLab config
docker exec my_gitlab gitlab-ctl check-config

# Starting GitLab
docker exec my_gitlab gitlab-ctl start
docker exec my_gitlab gitlab-ruby


