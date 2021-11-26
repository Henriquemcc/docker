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

# Updating GitLab container
docker-compose up -d

# Starting GitLab
docker start my_gitlab

# Updating gitlab
docker exec my_gitlab gitlab-ctl upgrade

# Checking GitLab config
docker exec my_gitlab gitlab-ctl check-config

# Starting GitLab
docker exec my_gitlab gitlab-ctl start
docker exec my_gitlab gitlab-ruby