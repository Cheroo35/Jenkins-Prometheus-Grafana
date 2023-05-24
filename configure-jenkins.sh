#!/bin/bash

# Patch management
sudo apt update -y 
sudo apt upgrade -y 

# Clean cache and remove outdated packages
sudo apt autoremove -y 
sudo apt autoclean -y 

# Check if Maven is installed
if ! command -v mvn; then
  echo "Maven is not installed. Installing now."
  sudo apt install maven -y
else
  echo "Maven is already installed"
fi

# Check if Java JDK 11 is installed
if ! command -v java || ! java -version | grep -q '11\.'; then
  echo "Java JDK 11 is not installed. Installing now."
  sudo apt install openjdk-11-jdk -y
else
  echo "Java JDK 11 is already installed"
fi

# Check if Docker is installed and service is started and enabled
if ! command -v docker || ! systemctl is-active --quiet docker; then
  echo "Docker is not installed or service is not started and enabled. Installing and starting now."
  sudo apt install docker.io -y
  sudo systemctl start docker
  sudo systemctl enable docker
else
  echo "Docker is already installed and service is started and enabled"
fi

# Install remaining packages
if ! command -v ansible; then
  echo "Ansible is not installed. Installing now."
  sudo apt install ansible -y
else
  echo "Ansible is already installed"
fi

if ! command -v docker-compose; then
  echo "Docker Compose is not installed. Installing now."
  sudo apt install docker-compose -y
else
  echo "Docker Compose is already installed"
fi

if ! command -v terraform; then
  echo "Terraform is not installed. Installing now."
  wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  sudo apt update && sudo apt install terraform -y
else
  echo "Terraform is already installed"
fi

if ! command -v wget; then
  echo "Wget is not installed. Installing now."
  sudo apt install wget -y
else

  echo "Wget is already installed"
fi

if ! command -v curl; then
  echo "Curl is not installed. Installing now."
  sudo apt install curl -y
else
  echo "Curl is already installed"
fi
echo "===================this is the end of our script=================="
exit
