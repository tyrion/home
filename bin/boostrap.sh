#!/usr/bin/env bash

if [[ $EUID -ne 0 || -z $SUDO_USER ]]; then
    echo "This script must be executed with sudo."
    exit 1
fi

apt-get update
apt-get install -y python2.7 python-dev python-setuptools
apt-get install -y tmux aptitude man-db command-not-found 
su -c 'easy_install --user -U pip virtualenv' $SUDO_USER
