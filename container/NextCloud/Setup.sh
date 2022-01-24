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

# Creating nextcloud data folder
mkdir -p "/srv/nextcloud/app" "/srv/nextcloud/db"

# Stopping NextCloud
docker stop my_nextcloud_app
docker stop my_nextcloud_db

# Removing old NextCloud
docker rm my_nextcloud_app
docker rm my_nextcloud_db

# Reading authentication file
set -a
source auth.env

# Building container
docker-compose build --pull

# Updating NextCloud container
docker-compose up -d

# Starting NextCloud
docker start my_nextcloud_app
docker start my_nextcloud_db