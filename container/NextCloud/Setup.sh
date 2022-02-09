#!/bin/bash

# Creating nextcloud data folder
app_dir="/srv/nextcloud/app"
db_dir="/srv/nextcloud/db"
mkdir -p "$app_dir" "$db_dir" || sudo mkdir -p "$app_dir" "$db_dir"

# Reading authentication file
set -a
source auth.env

# Building container
docker-compose build --pull || sudo docker-compose build --pull

# Updating NextCloud container
docker-compose up -d || sudo docker-compose up -d