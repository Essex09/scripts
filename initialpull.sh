#!/bin/bash

dir=/root/scripts

if [ -d $dir ] # Check if directory already exists
    then
    echo -e "$dir directory already exists"
else
    echo -e "Making $dir directory"
    mkdir -p $dir && cd $dir
fi
sleep 1;

# Clone repos
git clone https://github.com/harleyQu1nn/AggressorScripts.git
git clone https://github.com/Essex09/Kali-i3gaps-Install.git
git clone https://github.com/Essex09/dotfiles.git
