#!/bin/bash

# Creating nextcloud data folder
app_dir="/srv/nextcloud/app"
db_dir="/srv/nextcloud/db"
mkdir -p "$app_dir" "$db_dir" || sudo mkdir -p "$app_dir" "$db_dir"

# Stopping NextCloud
docker stop my_nextcloud_app || sudo docker stop my_nextcloud_app
docker stop my_nextcloud_db || sudo docker stop my_nextcloud_db

# Removing old NextCloud
docker rm my_nextcloud_app || sudo docker rm my_nextcloud_app
docker rm my_nextcloud_db || sudo docker rm my_nextcloud_db

# Reading authentication file
set -a
source auth.env

# Building container
docker-compose build --pull || sudo docker-compose build --pull

# Updating NextCloud container
docker-compose up -d

# Starting NextCloud
docker start my_nextcloud_app
docker start my_nextcloud_db