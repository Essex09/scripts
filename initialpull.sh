#!/bin/bash

dir=/opt/scripts

if [ -d $dir ] # Check if directory already exists
    then
    echo -e "#################################"
    echo -e "# $dir directory already exists #"
    echo -e "#################################"
    ls -alh $dir
else
    echo -e "#################################"
    echo -e "# Making $dir directory #"
    echo -e "#################################"
    mkdir -p $dir && cd $dir
    ls -alh $dir
fi
sleep 1;

# Clone repos
echo -e "\n"
echo -e "#################"
echo -e "# Cloning Repos #"
echo -e "#################"
git clone https://github.com/harleyQu1nn/AggressorScripts.git
git clone https://github.com/Essex09/Kali-i3gaps-Install.git
git clone https://github.com/Essex09/dotfiles.git
