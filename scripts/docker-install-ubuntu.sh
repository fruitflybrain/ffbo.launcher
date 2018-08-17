# Based on https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce
echo Uninstalling old Docker installations
sudo apt-get remove docker docker-engine docker.io


echo Updating the apt package index
sudo apt-get update

echo Installing packages to allow apt to use a repository over HTTPS
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

echo Adding the default GPG key for Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo Setting up the stable repository
sudo add-apt-repository \
   "deb [arch=$(uname -m)] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo Updating the apt package index
sudo apt-get update

echo Installing the latest version of Docker Community Edition
sudo apt-get install docker-ce

# Procedure for installing specific versions of Docker
# echo Checking which versions of Docker CE exist in the repository
#apt-cache madison docker-compose

# echo Installing a specific version of Docker CE
#DOCKER_CE_VERSION="18.03.0~ce-0~ubuntu"
#sudo apt-get install docker-ce=$DOCKER_CE_VERSION

# echo Testing whether the install worked correctly
# sudo docker run hello-world

# Based on https://docs.docker.com/compose/install
DOCKER_COMPOSE_VERSION="1.22.0"
echo Installing Docker Compose Version $DOCKER_COMPOSE_VERSION to /usr/local/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

echo Applying executable permissions to the Docker Compose binary
sudo chmod +x /usr/local/bin/docker-compose

echo Test the installation, should be version $DOCKER_COMPOSE_VERSION
docker-compose --version
