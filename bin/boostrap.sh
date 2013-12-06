#!/usr/bin/env bash

if [[ $EUID -ne 0 || -z $SUDO_USER ]]; then
    echo "This script must be executed with sudo."
    exit 1
fi

apt-get update
apt-get install -y python2.7 python-dev python-setuptools htop
apt-get install -y tmux aptitude man-db command-not-found build-essential 
su -c 'easy_install --user -U pip' $SUDO_USER
su -c '~/.local/bin/pip install --user -U virtualenv virtualenvwrapper' $SUDO_USER
