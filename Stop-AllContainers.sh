#!/bin/bash

# Stopping docker user containers
docker stop "$(docker ps -q)"

# Stopping docker root containers
sudo docker stop "$(sudo docker ps -q)"