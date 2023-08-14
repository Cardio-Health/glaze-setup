#!/bin/bash
# script.sh

# make sure you have docker installed. for testing locally, just download docker desktop and run it.

# if you have docker installed, run these 3 commands in terminal/command prompt

# Fetch docker-compose.yml
curl -O https://raw.githubusercontent.com/Cardio-Health/glaze-setup/main/docker/docker-compose.yml


export USER_KEY='<ENTER_YOUR_KEY HERE>'
#Example: export USER_KEY='d20ebdc1c64fe1bc05407e04314847fc:696ec0af7761b223c5a9808256795b7d817410ce7b9c753d4e27poi8e2ebb0331fkijf387d6941802f450f4b2bdbe5ba498c08'

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
