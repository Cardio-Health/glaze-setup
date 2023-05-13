#!/bin/bash
# script.sh

# make sure you have docker installed. for testing locally, just download docker desktop and run it.

# if you have docker installed, run these 2 commands
# Fetch docker-compose.yml

curl -O https://raw.githubusercontent.com/Cardio-Health/glaze-setup/main/docker/docker-compose.yml

# Start the application
docker-compose up -d


# your application is live at: http://localhost:3000/dashboard/create