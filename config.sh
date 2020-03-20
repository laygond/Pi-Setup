#!/bin/bash

#USER VARIABLES TO MODIFY
git_email="laygond_bryan@hotmail.com"
git_name="laygond"
pi_port=22          # Switch Pi Port for security: 1024 through 49151.
pi_username=pi      # Anything but the default pi
pi_passwd=raspberry # The passwd you will use during configuration
mailuser=laygond_bryan@hotmail.com
mailpsswd =
mailhub=smtp.office365.com:587
maildomain=hotmail.com

# My reference were:
# Security
# - https://raspberrytips.com/security-tips-raspberry-pi/
#
# ---Microsoft Email---
# Server name: smtp.office365.com
# Port: 587
# Encryption method: STARTTLS
#
# ---Google Email---
# Server name: smtp.gmail.com
# Port: 587
# Encryption method: STARTTLS

