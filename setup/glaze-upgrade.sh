#!/bin/bash
# script.sh

#always run these commands in same folder where you ran your commands last time
#go to folder where your current docker-compose file is located

#down current docker images
sudo docker compose down

#list current docker images
sudo docker images

#you will see your current version in terminal like 3.4
#please replace 3.x with your current version like  3.4

sudo docker rmi doctorati/glaze:frontend-3.x doctorati/glaze:backend-3.x doctorati/glaze:pg_database-3.x

# Fetch new docker-compose.yml
curl -O https://raw.githubusercontent.com/Cardio-Health/glaze-setup/main/docker/docker-compose.yml

export FRONTEND_URL=http://<your_host>
#Example: export FRONTEND_URL=http://ec2-43-204-98-46.ap-south-1.compute.amazonaws.com
#Example: export FRONTEND_URL=http://localhost:3000
#If you are using host other than localhost, then make sure that http traffic to that host:80 is enabled.

# Start the application
sudo -E docker compose up -d 
# your application is live at: http://<your_host>/dashboard/create
# your application is live at: http://ec2-43-204-98-46.ap-south-1.compute.amazonaws.com/dashboard/create
# your application is live at: http://localhost:3000/dashboard/create
