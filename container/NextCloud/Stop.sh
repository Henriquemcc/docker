#!/bin/bash

docker stop my_nextcloud_app || sudo docker stop my_nextcloud_app
docker stop my_nextcloud_db || sudo docker stop my_nextcloud_db