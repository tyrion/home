#!/usr/bin/env bash

if [[ $EUID -ne 0 || -z $SUDO_USER ]]; then
    echo "This script must be executed with sudo."
    exit 1
fi

apt-get update
apt-get install -y python2.7 python-dev python-setuptools htop git
apt-get install -y tmux aptitude man-db command-not-found build-essential 

su -m $SUDO_USER <<EOF
easy_install --user -U pip
~/.local/bin/pip install --user -U virtualenv virtualenvwrapper
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
EOF
