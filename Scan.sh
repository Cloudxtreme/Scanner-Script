#!/bin/bash
#
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

# Just a Simple Multi Line Seperation
        echo
        echo
echo "Enter directory name"
        read dirname

if [ ! -d "$dirname" ];
        then
                echo "File doesn't exist. Creating now"
                mkdir /root/$dirname
                echo "File created"
else
        echo "File exists"
fi
# Just a Simple Multi Line Seperation
        echo
        echo

# IP Address to be scanned
echo "Enter the target and subdomains below ex. '10.10.10.1 or 10.10.10.1/24'"
        echo
echo "Enter Ip Address: "
        read IpAddress &&

# Just a Simple Multi Line Seperation
        echo
        echo

# Port Numbers to be scanned
echo "Enter the port number/s below ex. ''80, 90, 60' or '1-250'"
        echo
echo "Enter Port Number/s you want scanned: "
        read PortNumber &&

# Just a Simple Multi Line Seperation
        echo
        echo

# What the file is to be called
echo "What would you like to name this baby?: "
        read FileName &&

nmap -sS -p $PortNumber -A $IpAddress -oX /root/$dirname/$FileName
