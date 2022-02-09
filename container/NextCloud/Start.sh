#!/bin/bash

docker start my_nextcloud_db || sudo docker start my_nextcloud_db
docker start my_nextcloud_app || sudo docker start my_nextcloud_app