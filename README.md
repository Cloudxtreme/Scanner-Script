# This is a simple script for those who are using Kali linux to run Nmap with a Syn Tcp scan including OS detection and Serivce Detection. 
# This is my first real bash script. It simply asks for a directory name and checks if it exists in /root. If not it makes the directory you named.
# It then asks for an IP address or a range of IP addresses.
# It then asks for Port/s to be scanned.
# Finally it asks what you would like to name this file and stores Nmaps output in the /root/* what ever you named your directory at the begining.

*****UPDATE 02/06/2018*****

I have now cleaned up the script a bit and added an attached function for using dirb to brute force directory scan the site after the Nmap Scan.

Please let me know of any suggestions!
