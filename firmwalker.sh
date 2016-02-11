#!/bin/bash

if [[ $# -ne 1 ]] ; then
	echo 'Usage:'
	echo './firmwalker {path to root file system}'
	echo 'Example: ./firmwalker linksys/fmk/rootfs'
	exit
fi

FIRMDIR=$1
file="firmwalker.txt"

echo "Search for passwd and shadow files" > $file
echo "---passwd---" >> $file
find $FIRMDIR -name "passwd"  >> $file
echo "---shadow---" >> $file
find $FIRMDIR -name "shadow" >> $file
echo >> $file
echo "List etc/ssl directory" >> $file
echo "---etc/ssl---" >> $file
ls -l $FIRMDIR/etc/ssl >> $file
echo >> $file
echo "---------------------------------------------------------------------------------------" >> $file
echo "Search for SSH authorized_keys file" >> $file
find $FIRMDIR -name "authorized_keys" >> $file
echo >> $file
echo "---------------------------------------------------------------------------------------" >> $file
echo "Search for configuration files" >> $file
find $FIRMDIR -name "*.conf" >> $file
find $FIRMDIR -name "*.cfg" >> $file
echo >> $file
echo "---------------------------------------------------------------------------------------" >> $file
echo "Search for SSL related files" >> $file
find $FIRMDIR -name "*.pem" >> $file
find $FIRMDIR -name "*.crt" >> $file
find $FIRMDIR -name "*.cer" >> $file
find $FIRMDIR -name "*.p7b" >> $file
find $FIRMDIR -name "*.p12" >> $file
echo >> $file
echo "---------------------------------------------------------------------------------------" >> $file
echo "Search for shell scripts" >> $file
find $FIRMDIR -name "*.sh" >> $file
echo >> $file
echo "---------------------------------------------------------------------------------------" >> $file
echo "Search for other .bin files" >> $file
find $FIRMDIR -name "*.bin" >> $file
echo >> $file
echo "---------------------------------------------------------------------------------------" >> $file
echo "Search for patterns in files" >> $file
echo "---admin-------------------------------------------------------------------------------" >> $file
grep -sirnw $FIRMDIR -e "admin" | fold -w 80 >> $file
echo "---root--------------------------------------------------------------------------------" >> $file
grep -sirnw $FIRMDIR -e "root" | fold -w 80 >> $file
echo "---password----------------------------------------------------------------------------" >> $file
grep -sirnw $FIRMDIR -e "password" | fold -w 80 >> $file
echo "---passwd------------------------------------------------------------------------------" >> $file
grep -sirnw $FIRMDIR -e "passwd" | fold -w 80 >> $file
echo "---pwd---------------------------------------------------------------------------------" >> $file
grep -sirnw $FIRMDIR -e "pwd" | fold -w 80 >> $file
echo "---default-----------------------------------------------------------------------------" >> $file
grep -sirnw $FIRMDIR -e "default" | fold -w 80 >> $file
echo "---dropbear----------------------------------------------------------------------------" >> $file
grep -sirnw $FIRMDIR -e "dropbear" | fold -w 80 >> $file
echo "---ssl---------------------------------------------------------------------------------" >> $file
grep -sirnw $FIRMDIR -e "ssl" | fold -w 80 >> $file
echo "---remote------------------------------------------------------------------------------" >> $file
grep -sirnw $FIRMDIR -e "remote" | fold -w 80 >> $file
echo "---encrypt-----------------------------------------------------------------------------" >> $file
grep -sirnw $FIRMDIR -e "encrypt" | fold -w 80 >> $file
echo "---private-----------------------------------------------------------------------------" >> $file
grep -sirnw $FIRMDIR -e "private" | fold -w 80 >> $file
echo "---api---------------------------------------------------------------------------------" >> $file
grep -sirnw $FIRMDIR -e "api" | fold -w 80 >> $file
echo >> $file
echo "---------------------------------------------------------------------------------------" >> $file
echo "Search for web servers" >> $file
find $FIRMDIR -name "lighttpd" >> $file
find $FIRMDIR -name "alphapd" >> $file
find $FIRMDIR -name "httpd" >> $file
echo >> $file
echo "---------------------------------------------------------------------------------------" >> $file
echo "Search for important binaries" >> $file
find $FIRMDIR -name "ssh" >> $file
find $FIRMDIR -name "scp" >> $file
find $FIRMDIR -name "sftp" >> $file
find $FIRMDIR -name "tftp" >> $file
find $FIRMDIR -name "dropbear" >> $file
find $FIRMDIR -name "busybox" >> $file
find $FIRMDIR -name "telnet" >> $file
