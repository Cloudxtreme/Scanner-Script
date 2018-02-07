#!/bin/bash
# This is my first real bash script. It simply asks for a directory name and
# checks if it exists in /root is not it makes the directory you named.

# It then asks for an IP address or a range of IP addresses.

# It then asks for Port/s to be scanned.

# Finally it asks what you would like to name this file and stores it in the
# /root/* what ever you named your directory at the begining.







cat << "EOF"

 _   _ _       _     _  ______                 _                 _____                                 
| \ | (_)     | |   | | | ___ \               | |               /  ___|                                
|  \| |_  __ _| |__ | |_| |_/ / __ _ _ __  ___| |__   ___  ___  \ `--.  ___ __ _ _ __  _ __   ___ _ __ 
| . ` | |/ _` | '_ \| __| ___ \/ _` | '_ \/ __| '_ \ / _ \/ _ \  `--. \/ __/ _` | '_ \| '_ \ / _ \ '__|
| |\  | | (_| | | | | |_| |_/ / (_| | | | \__ \ | | |  __/  __/ /\__/ / (_| (_| | | | | | | |  __/ |   
\_| \_/_|\__, |_| |_|\__\____/ \__,_|_| |_|___/_| |_|\___|\___| \____/ \___\__,_|_| |_|_| |_|\___|_|   
          __/ |                                                                                        
         |___/                                                                                         

           | )/ )
        \\ |//,' __
        (")(_)-"()))=-
           (\\
EOF

	echo
	echo
echo "Enter A new directory name please."
	read dirname

if [ ! -d "$dirname" ];
	then
		echo "File doesn't exist. Creating now"
		mkdir /root/$dirname
		echo "File created"
else
	echo "File exists"
fi

clear

# IP Address to be scanned
echo "Enter the target and/or subdomains below ex. '10.10.10.1 or 10.10.10.1/24'"
	echo
echo "Enter Ip Address: "
	read IpAddress &&

clear

# Port Numbers to be scanned
echo "Enter the port number/s below ex. ''80, 90, 60' or '1-250'"
	echo
echo "Enter Port Number/s you want scanned: "
	read PortNumber &&

clear

# What the file is to be called
echo "What would you like to name this baby?: "
	read FileName &&
clear
echo "Please wait while report is generated"
nmap -sS -p $PortNumber -A $IpAddress -oX /root/$dirname/$FileName

clear

                               ###  Part II  ###

                          ## Directory Buster Scan ##

echo "Initiating Directory Scan...."
echo
echo "What do you wanna name this baby?"
	read FileName1 &&
clear

echo "Enter the Domain Name as follows: 'http://10.10.10.10 or https://10.10.10.10'"
echo
echo "Enter Domain Name: "
	read DomainName &&
clear

echo "                                      ###  Directory Buster Scanning  ###"


## Menu list design is as followed

PS3='Select a word list and press Enter: '

echo
echo

echo "After making a selection it may take awhile to generate the report."

echo
echo

options=("Apache" "Common" "Big")

select opt in "${options[@]}"

do
  case $opt in
        "Apache")
          dirb $DomainName '/usr/share/wordlists/dirbuster/apache-user-enum-1.0.txt' > /root/$dirname/$FileName1
          ;;
        "Common")
          dirb $DomainName '/usr/share/wordlists/dirb/common.txt' > /root/$dirname/$FileName1
          ;;
        "Big")
          dirb $DomainName '/usr/share/wordlists/dirb/big.txt' > /root/$dirname/$FileName1
          ;;
        *) echo "invalid option";;
  esac

done
echo "Have A Nice Day"
