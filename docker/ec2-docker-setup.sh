


# setup docker in your machine (only if you haven't)
sudo apt-get install docker.io -y
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

apt-cache policy docker-ce

docker --version

sudo systemctl enable docker


#setup nginx in your machine

sudo apt install nginx
sudo vi /etc/nginx/sites-available/default 

#Paste this:
"""
server {
    listen 80;

    # Set the proxy timeouts
    proxy_connect_timeout 600s;
    proxy_send_timeout 600s;
    proxy_read_timeout 600s;
    send_timeout 600s;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

"""


sudo ufw app list
sudo ufw allow 'Nginx HTTP'
sudo ufw status
systemctl status nginx
sudo systemctl restart nginx


#setup glaze image

curl -O https://raw.githubusercontent.com/Cardio-Health/glaze-setup/main/docker/docker-compose.yml
export USER_KEY='0d86348157fb070ee6d6481069f00f42:acd393b9e3b45064afc4e1753a56bb73f7443f8a8603e88b0a381ec90a437e5388fc27cb1fd0d3763c5f7128ac7796ee423677'
export NEXT_PUBLIC_FRONTEND_URL=http://localhost:3000
sudo -E docker compose up -d
