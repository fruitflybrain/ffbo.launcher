# Based on https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce
# Uninstall old Docker versions
sudo apt-get remove docker docker-engine docker.io

# Update the apt package index
sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up the stable repository
sudo add-apt-repository \
   "deb [arch=$(uname -m)] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the apt package index
sudo apt-get update

# Install the latest version of Docker CE
sudo apt-get install docker-ce

# Check which versions of Docker CE exist in the repository
#apt-cache madison docker-compose

# Install a specific version of Docker CE
#DOCKER_CE_VERSION="18.03.0~ce-0~ubuntu"
#sudo apt-get install docker-ce=$DOCKER_CE_VERSION

# Test whether the install worked correctly
# sudo docker run hello-world
