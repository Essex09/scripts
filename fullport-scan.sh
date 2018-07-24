#!/bin/bash
# Takes user input to scan a host, creates directory, subfolders titled exploit and scans, then creates a txt file called notes.

###################
# Add color
###################

red='\033[0;31m'
nc='\033[0m' # No Color

if [ $# -ne 3 ]; then
    echo -e "${red}Usage: $0 [IP Address] [Directory] (e.g., /home) [quick/full]${nc}"
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
# Nmap commands from @killswitch-GUI
###################

if [[ $3 = quick ]]; then
    echo -e "${red}Beginning quick Nmap scans on $1${nc}"
    nmap -Pn -sS --min-hostgroup 255 --min-rtt-timeout 25ms --max-rtt-timeout 100ms --max-retries 1 --max-scan-delay 0 --min-rate 2000 -oA $newdir/scans/quickscan -vvv --open $1	
elif [[ $3 = full ]]; then
    echo -e "${red}Beginning fullport Nmap scan on $1${nc}"
    nmap -Pn -sS -p- -sV --min-hostgroup 255 --min-rtt-timeout 25ms --max-rtt-timeout 100ms --max-retries 1 --max-scan-delay 0 --min-rate 1000 -oA $newdir/scans/fullport -vvv --open $1

else
   echo -e "${red}You didn't select a scan option of quick or full!${nc}"
fi
    
sleep .5;
echo -e "\n"
echo -e "${red}Findings written to $newdir/scans/${nc}"

sleep .5;
echo -e "\n"
echo -e "${red}Goodbye!${nc}"
exit

###################
# Coming soon:
# Write predefined commands to run based on detected services
###################
