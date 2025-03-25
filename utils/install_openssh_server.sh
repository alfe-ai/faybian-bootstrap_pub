#!/bin/bash

sudo apt update -y
sudo apt install openssh-server -y
sudo systemctl status ssh

