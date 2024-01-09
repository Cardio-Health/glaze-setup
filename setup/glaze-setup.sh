#!/bin/bash
# script.sh

# make sure you have docker installed. for testing locally, just download docker desktop and run it.

# if you have docker installed, run these 3 commands in terminal/command prompt

# Fetch docker-compose.yml
curl -O https://raw.githubusercontent.com/Cardio-Health/glaze-setup/main/new_docker/docker-compose.yml

# Create a folder to store your local data
mkdir ~/pg_data

export FRONTEND_URL=http://<your_host>
#Example: export NEXT_PUBLIC_FRONTEND_URL=http://localhost:3000
#Example: export FRONTEND_URL=http://ec2-43-204-98-46.ap-south-1.compute.amazonaws.com
#If you are using host other than localhost, then make sure that http traffic to that host is routed to port 3000.

# Start the application
docker-compose up -d 
#if sudo is required then sudo -E docker-compose up -d

#  wait for atleast 1 minute for the application to start 
# your application is live at: http://localhost:3000/dashboard/create
# your application is live at: http://ec2-43-204-98-46.ap-south-1.compute.amazonaws.com/dashboard/create



#   - Always include http:// in your $FRONTEND_URL or any other host environment variable
#   - Try to use nginx so that you can directly use your frontend on port 80, as they might forget to add 3000 to URLs every time.
#   - Frontend service will always start on port 3000

#   If you are deploying GlazeGPT in a dedicated machine and If you are using docker-compose, no need to export these environment variables: MANUAL_BACKEND_HOST, MANUAL_DATABASE_HOST, and MANUAL_DATABASE_PORT

#   In case you want to deploy all 3 docker images in different networks, some information:
#       - Backend service will always start on port 8000
#       - MANUAL_BACKEND_HOST example: http://backend.glazegpt.abcd.com  or http://25.34.123.212:8000. if not on port 80, include port in this environment variable.
#       - MANUAL_DATABASE_HOST example: http://database.glazegpt.abcd.com
#       - MANUAL_DATABASE_PORT example: 5432
#       - frontend health check GET API URL is: $FRONTEND_URL/api/glaze/healthcheck  
#       - backend health check GET API URL is: $MANUAL_BACKEND_HOST/b/api/healthcheck 

