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

# Creating WordPress data folder
mkdir -p "/srv/wordpress/app" "/srv/wordpress/db"

# Stopping WordPress
docker stop my_wordpress_app
docker stop my_wordpress_db

# Removing old WordPress
docker rm my_wordpress_app
docker rm my_wordpress_db

# Reading authentication file
set -a
source auth.env

# Updating WordPress container
docker-compose up -d

# Starting WordPress
docker start my_wordpress_app
docker start my_wordpress_db