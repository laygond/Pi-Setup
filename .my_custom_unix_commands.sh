#!/bin/bash

# my reference:
# https://medium.com/devnetwork/how-to-create-your-own-custom-terminal-commands-c5008782a78e


# --------- CUSTOM COMMANDS by Bryan Laygond (personal) -----------

# Open Dropbox Paper Notes in Chrome
function paper() {
  google-chrome https://paper.dropbox.com/folder/show/Tutorials-e.1gg8YzoPEhbTkrhvQwJ2zzxOY3ofXnw0n4dMNrcQppzTfcD5Utlp
}

# Clone from GitHub faster
function clone() {
  if [[ $# -eq 1 ]]
  then
    git clone "https://github.com/laygond/$1.git"
  else
    echo "Just one argument allowed: insert repo name"
  fi
}

# Check CPU info
function cpuinfo() {
  cat /proc/cpuinfo
}

# Check Kernel info
function kernelinfo() {
  uname -a
}

# Check OS info
function osinfo() {
  cat /etc/os-release
}