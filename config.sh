#!/bin/bash

#USER VARIABLES TO MODIFY
git_email="laygond_bryan@hotmail.com"
git_name="laygond"
pi_port=2183        # Available Ports List below: 1024 through 49151.
pi_username=pi      # Anything but the default pi
mailuser=laygond_bryan@hotmail.com
mailpsswd =
mailhub=smtp.office365.com:587
maildomain=hotmail.com

# My reference were:
# Security
# - https://raspberrytips.com/security-tips-raspberry-pi/
# - https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers
#
# Email
# - https://www.youtube.com/watch?v=P_hpXQ8VgPI&list=PLNnwglGGYoTvy37TSGFlv-aFkpg7owWrE&index=12
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

