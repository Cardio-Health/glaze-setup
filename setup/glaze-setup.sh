#!/bin/bash
# script.sh

# Fetch docker-compose.yml
curl -O https://raw.githubusercontent.com/Cardio-Health/glaze-setup/main/docker/docker-compose.yml

# Start the application
docker-compose up -d