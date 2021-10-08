sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io net-tools
sudo mv -f /home/ubuntu/daemon.json /etc/docker/daemon.json
sudo mkdir /etc/systemd/system/docker.service.d
sudo mv -f /home/ubuntu/override.conf /etc/systemd/system/docker.service.d/override.conf
sudo systemctl daemon-reload
sudo groupadd docker
sudo usermod -aG docker ubuntu
sudo systemctl enable docker
sudo ufw allow 2376/tcp
# set DOCKER_HOST=tcp://192.168.132.151:2376
# multipass exec dockerhost -- sudo ufw allow 2376/tcp
sudo systemctl start docker
sudo systemctl restart docker.service