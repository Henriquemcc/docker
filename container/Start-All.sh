#!/bin/bash

# Starting GitLab
cd "Gitlab" || exit 1
bash Start.sh
cd ".." || exit 1

# Starting NextCloud
cd "NextCloud" || exit 1
bash Start.sh
cd ".." || exit 1

# Starting WordPress
cd "WordPress" || exit 1
bash Start.sh
cd ".." || exit 1
