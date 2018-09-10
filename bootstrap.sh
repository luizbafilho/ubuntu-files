#!/bin/sh

echo "Installing ansible"
sudo apt update
sudo apt install -y python3-pip
sudo pip3 install ansible
