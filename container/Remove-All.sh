#!/bin/bash

# Runs this script as root if it is not root.
function run_as_root() {
  if [ "$(whoami)" != "root" ]; then
    echo "This script is not running as root"
    echo "Elevating privileges..."
    if [ "$(command -v sudo)" ]; then
      sudo bash "$0"
      exit $?
    else
      echo "Sudo is not installed"
      exit 1
    fi
  fi
}

# Stops and removes all docker containers
function remove_all_containers() {

  # Stopping and deleting all containers
  for container in $(docker ps -aq); do

    # Stopping container
    docker stop --time 0 "$container"

    # Deleting container
    docker rm "$container"

  done
}

# Removing all containers as non root user
remove_all_containers

# Removing all containers as root user
run_as_root
remove_all_containers
