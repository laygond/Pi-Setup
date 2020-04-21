#!/bin/bash

#USER VARIABLES TO MODIFY
git_email="laygond_bryan@hotmail.com"
git_name="laygond"
pi_port=9000        # Available Ports List below: 1024 through 49151.
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
# Data Communication
# - https://www.mbtechworks.com/hardware/raspberry-pi-UART-SPI-I2C.html
# - https://www.raspberrypi.org/documentation/configuration/uart.md
#
# Crontab and Github Permissions
# - https://opensource.com/article/17/11/how-use-cron-linux
# - https://stackoverflow.com/questions/9270734/ssh-permissions-are-too-open-error
# - https://stackoverflow.com/questions/4565700/how-to-specify-the-private-ssh-key-to-use-when-executing-shell-command-on-git
#
#
# NOTE: RPi has two UARTs. A fully functional UART and a second one called a "mini" UART with less capability. Prior to RPi 3, the full UART was available on GPIO pins 8 and 10. However, to support Bluetooth on the RPi 3, the full UART was moved from the GPIO to the Bluetooth chip and the mini UART was made available on GPIO pins 8 and 10.
# It is possible to redirect the full UART to the GPIO, but requires configuration changes. For more detail about this topic, see Raspberry Pi's UART documentation.
# Either UART uses GPIO pin 8 (BCM GPIO 14) for transmit and pin 10 (BCM GPIO 15) for receive.
