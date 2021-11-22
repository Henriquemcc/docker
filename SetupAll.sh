#!/bin/bash

# Setting up GitLab
cd "Gitlab" || exit 1
bash Setup.sh
cd ".." || exit 1

# Setting up NextCloud
cd "NextCloud" || exit
bash Setup.sh
cd ".." || exit 1