#!/bin/bash
# Takes user input to scan a host, creates directory, subfolders titled exploit and scans, then creates a txt file called notes.
# Add color
red='\033[0;31m'
nc='\033[0m' # No Color

if [ $# -ne 1 ]; then
    echo -e "{red}Usage: $0 [IP Address]${nc}"
    exit 1
fi

#Create directories
newdir=`pwd`/$1
if [ -d $newdir ] # Check if directory already exists
    then
    echo -e "${red}Directory already exists${nc}"
else
    echo -e "${red}Making directories${nc}"
    mkdir -p $newdir && cd $newdir && mkdir scans exploit && touch notes
fi
sleep 1;

# Begin full TCP portscan with Nmap
echo -e "${red}Beginning Nmap scans on $1${nc}"
sleep .5;

nmap -Pn -vv -sS -sV -p- -oA $newdir/scans/fullport $1
sleep 1;
echo -e "\n"
echo -e "${red}Findings written to $newdir/scans/${nc}"
exit
