#!/bin/bash
# Takes user input to scan a host, creates directory, subfolders titled exploit and scans, then creates a txt file called notes.
###################
# Add color
###################
red='\033[0;31m'
nc='\033[0m' # No Color

if [ $# -ne 2 ]; then
    echo -e "{red}Usage: $0 [IP Address] [Directory] (e.g., /home)${nc}"
    exit 1
fi

###################
# Create directories
###################
newdir=$2/$1
if [ -d $newdir ] # Check if directory already exists
    then
    echo -e "${red}Directory already exists${nc}"
else
    echo -e "${red}Making directories${nc}"
    mkdir -p $newdir && cd $newdir && mkdir scans exploit && touch notes
fi
sleep 1;

###################
# Full TCP scan with Nmap
###################
echo -e "${red}Beginning Nmap scans on $1${nc}"
sleep .5;

###################
# From @killswitch-GUI
# Full port scan
###################
nmap -Pn -sS -p- -sV --min-hostgroup 255 --min-rtt-timeout 25ms --max-rtt-timeout 100ms --max-retries 1 --max-scan-delay 0 --min-rate 1000 -oA $newdir/scans/fullport -vvv --open $
sleep 1;
echo -e "\n"
echo -e "${red}Findings written to $newdir/scans/${nc}"
exit

###################
# Coming soon:
# Write predefined commands to run based on detected services
# Options to choose between quick and full port scan
###################
