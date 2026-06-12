#!/bin/bash

#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo "Please run this script as root or using sudo."
    exit 1
fi


packages="nginx curl wget"

for package in $packages
do
    if dpkg -s $package >/dev/null 2>&1
    then
        echo "$package is already installed. Skipping..."
    else
        echo "$package is not installed. Installing..."
        sudo apt install -y $package
    fi
done
