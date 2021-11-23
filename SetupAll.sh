#!/bin/bash

# Setting up GitLab
cd "Gitlab" || exit 1
bash Setup.sh
cd ".." || exit 1

# Setting up NextCloud
cd "NextCloud" || exit 1
bash Setup.sh
cd ".." || exit 1

# Setting up WordPress
cd "WordPress" || exit 1
bash Setup.sh
cd ".." || exit 1