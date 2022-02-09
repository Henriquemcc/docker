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

# Stops all docker containers
function stop_all_containers() {

  # Stopping all containers
  for container in $(docker ps -aq); do
    docker stop --time 0 "$container"
  done

}

# Stopping all containers as non root user
stop_all_containers

# Stopping all containers as root
run_as_root
stop_all_containers