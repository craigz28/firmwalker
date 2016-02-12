#!/bin/bash

#Check for argument
if [[ $# -ne 1 ]] ; then
	echo 'Usage:'
	echo './firmwalker {path to extracted file system of firmware}'
	echo 'Example: ./firmwalker linksys/fmk/rootfs/'
	exit
fi

#Set variables
FIRMDIR=$1
file="firmwalker.txt"

#Remove previous file
rm $file

#Perform searches
echo "Firmware Directory" | tee -a $file
echo $FIRMDIR | tee -a $file
echo "Search for passwd and shadow files" | tee -a $file
echo "#####################################passwd############################################" | tee -a $file
find $FIRMDIR -name "passwd" | cut -c${#FIRMDIR}- | tee -a $file
echo "#####################################shadow############################################" | tee -a $file
find $FIRMDIR -name "shadow" | cut -c${#FIRMDIR}- | tee -a $file
echo | tee -a $file
echo "List etc/ssl directory" | tee -a $file
echo "#####################################etc/ssl###########################################" | tee -a $file
ls -l $FIRMDIR/etc/ssl | tee -a $file
echo | tee -a $file
echo "Search for SSH authorized_keys file" | tee -a $file
echo "####################################SSH################################################" | tee -a $file
find $FIRMDIR -name "authorized_keys" | cut -c${#FIRMDIR}- | tee -a $file
echo | tee -a $file
echo "Search for configuration files" | tee -a $file
echo "#####################################configuration files###############################" | tee -a $file
find $FIRMDIR -name "*.conf" | cut -c${#FIRMDIR}- | tee -a $file
find $FIRMDIR -name "*.cfg" | cut -c${#FIRMDIR}- | tee -a $file
echo | tee -a $file
echo "Search for SSL related files" | tee -a $file
echo "#####################################SSL files#########################################" | tee -a $file
find $FIRMDIR -name "*.pem" | cut -c${#FIRMDIR}- | tee -a $file
find $FIRMDIR -name "*.crt" | cut -c${#FIRMDIR}- | tee -a $file
find $FIRMDIR -name "*.cer" | cut -c${#FIRMDIR}- | tee -a $file
find $FIRMDIR -name "*.p7b" | cut -c${#FIRMDIR}- | tee -a $file
find $FIRMDIR -name "*.p12" | cut -c${#FIRMDIR}- | tee -a $file
echo | tee -a $file
echo "Search for shell scripts" | tee -a $file
echo "#####################################shell scripts#####################################" | tee -a $file
find $FIRMDIR -name "*.sh" | cut -c${#FIRMDIR}- | tee -a $file
echo | tee -a $file
echo "Search for other .bin files" | tee -a $file
echo "#####################################bin files#########################################" | tee -a $file
find $FIRMDIR -name "*.bin" | cut -c${#FIRMDIR}- | tee -a $file
echo | tee -a $file
echo "Search for patterns in files" | tee -a $file
echo "#####################################admin#############################################" | tee -a $file
grep -lsirnw $FIRMDIR -e 'admin' | cut -c${#FIRMDIR}- | tee -a $file
echo "#####################################root##############################################" | tee -a $file
grep -lsirnw $FIRMDIR -e "root" | cut -c${#FIRMDIR}- | tee -a $file
echo "#####################################password##########################################" | tee -a $file
grep -lsirnw $FIRMDIR -e "password" | cut -c${#FIRMDIR}- | tee -a $file
echo "#####################################passwd############################################" | tee -a $file
grep -lsirnw $FIRMDIR -e "passwd" | cut -c${#FIRMDIR}- | tee -a $file
echo "#####################################pwd###############################################" | tee -a $file
grep -lsirnw $FIRMDIR -e "pwd" | cut -c${#FIRMDIR}- | tee -a $file
echo "#####################################default###########################################" | tee -a $file
grep -lsirnw $FIRMDIR -e "default" | cut -c${#FIRMDIR}- | tee -a $file
echo "#####################################dropbear##########################################" | tee -a $file
grep -lsirnw $FIRMDIR -e "dropbear" | cut -c${#FIRMDIR}- | tee -a $file
echo "#####################################ssl###############################################" | tee -a $file
grep -lsirnw $FIRMDIR -e "ssl" | cut -c${#FIRMDIR}- | tee -a $file
echo "#####################################remote############################################" | tee -a $file
grep -lsirnw $FIRMDIR -e "remote" | cut -c${#FIRMDIR}- | tee -a $file
echo "#####################################encrypt###########################################" | tee -a $file
grep -lsirnw $FIRMDIR -e "encrypt" | cut -c${#FIRMDIR}- | tee -a $file
echo "#####################################private###########################################" | tee -a $file
grep -lsirnw $FIRMDIR -e "private"  | cut -c${#FIRMDIR}- | tee -a $file
echo "#####################################api###############################################" | tee -a $file
grep -lsirnw $FIRMDIR -e "api" | cut -c${#FIRMDIR}- | tee -a $file
echo | tee -a $file
echo "Search for web servers" | tee -a $file
echo "#####################################search for web servers############################" | tee -a $file
find $FIRMDIR -name "lighttpd" | cut -c${#FIRMDIR}- | tee -a $file
find $FIRMDIR -name "alphapd" | cut -c${#FIRMDIR}- | tee -a $file
find $FIRMDIR -name "httpd" | cut -c${#FIRMDIR}- | tee -a $file
echo | tee -a $file
echo "Search for important binaries" | tee -a $file
echo "#####################################important binaries################################" | tee -a $file
find $FIRMDIR -name "ssh" | cut -c${#FIRMDIR}- | tee -a $file
find $FIRMDIR -name "scp" | cut -c${#FIRMDIR}- | tee -a $file
find $FIRMDIR -name "sftp" | cut -c${#FIRMDIR}- | tee -a $file
find $FIRMDIR -name "tftp" | cut -c${#FIRMDIR}- | tee -a $file
find $FIRMDIR -name "dropbear" | cut -c${#FIRMDIR}- | tee -a $file
find $FIRMDIR -name "busybox" | cut -c${#FIRMDIR}- | tee -a $file
find $FIRMDIR -name "telnet" | cut -c${#FIRMDIR}- | tee -a $file
