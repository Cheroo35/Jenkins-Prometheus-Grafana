#!/bin/bash

# Update package lists
sudo apt update

# Install Apache
sudo apt install apache2 -y

# Start Apache service
sudo systemctl start apache2

# Enable Apache to start on boot
sudo systemctl enable apache2

# Display Apache status
sudo systemctl status apache2