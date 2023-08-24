


#!/bin/bash
# script.sh

#go to folder where your current docker-compose file is located
#remove current docker compose file
rm docker-compose.yml

#down current docker images
sudo docker compose down

#list current docker images
sudo docker images

#you will see your current version in terminal like 2.3
#please replace x with your current version

sudo docker rmi doctorati/glaze:frontend-2.x doctorati/glaze:backend-2.x doctorati/glaze:database-2.x

# Fetch new docker-compose.yml
curl -O https://raw.githubusercontent.com/Cardio-Health/glaze-setup/main/docker/docker-compose.yml


export USER_KEY='<ENTER_YOUR_KEY HERE>'
#Example: export USER_KEY='d20ebdc1c64fe1bc05407e04314847fc:696ec0af7761b223c5a9808256795b7d817410ce7b9c753d4e27poi8e2ebb0331fkijf387d6941802f450f4b2bdbe5ba498c08'

export FRONTEND_URL=http://<your_host>
#Example: export FRONTEND_URL=http://ec2-43-204-98-46.ap-south-1.compute.amazonaws.com
#Example: export NEXT_PUBLIC_FRONTEND_URL=http://localhost:3000
#If you are using host other than localhost, then make sure that http traffic to that host is routed to port 3000.

# Start the application
sudo -E docker-compose up -d 
# your application is live at: http://ec2-43-204-98-46.ap-south-1.compute.amazonaws.com/dashboard/create
# your application is live at: http://localhost:3000/dashboard/create
