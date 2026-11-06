#!/bin/bash

echo "Starting Security Hardening..."

# Update package list
echo -e "\n Updating packages..."
sudo apt update && sudo apt upgrade -y

# Configure UFW
echo -e "\n Configuring UFW..."
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw --force enable

# Check for open ports
echo -e "\n Current Open Ports:"
sudo ss -tulpn

echo -e "\n Hardening Complete"