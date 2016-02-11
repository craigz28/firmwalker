#!/bin/bash
echo "Please enter file name:"
read filename
echo "You entered: $filename"
file="../$filename"

echo "Search for passwd and shadow files" > $file
echo "---passwd---" >> $file
find . -name "passwd"  >> $file
echo "---shadow---" >> $file
find . -name "shadow" >> $file
echo >> $file
echo "List etc/ssl directory" >> $file
echo "---etc/ssl---" >> $file
ls -l etc/ssl >> $file
echo >> $file
echo "------------------------------------------------------------" >> $file
echo "Search for SSH authorized_keys file" >> $file
find . -name "authorized_keys" >> $file
echo >> $file
echo "------------------------------------------------------------" >> $file
echo "Search for configuration files" >> $file
find . -name "*.conf" >> $file
find . -name "*.cfg" >> $file
echo >> $file
echo "------------------------------------------------------------" >> $file
echo "Search for SSL related files" >> $file
find . -name "*.pem" >> $file
find . -name "*.crt" >> $file
find . -name "*.cer" >> $file
find . -name "*.p7b" >> $file
find . -name "*.p12" >> $file
echo >> $file
echo "------------------------------------------------------------" >> $file
echo "Search for shell scripts" >> $file
find . -name "*.sh" >> $file
echo >> $file
echo "------------------------------------------------------------" >> $file
echo "Search for other .bin files" >> $file
find . -name "*.bin" >> $file
echo >> $file
echo "------------------------------------------------------------" >> $file
echo "Search for patterns in files" >> $file
echo "---admin----------------------------------------------------" >> $file
grep -irnw '.' -e "admin" | fold -w 80 >> $file
echo "---root-----------------------------------------------------" >> $file
grep -irnw '.' -e "root" | fold -w 80 >> $file
echo "---password-------------------------------------------------" >> $file
grep -irnw '.' -e "password" | fold -w 80 >> $file
echo "---passwd---------------------------------------------------" >> $file
grep -irnw '.' -e "passwd" | fold -w 80 >> $file
echo "---pwd------------------------------------------------------" >> $file
grep -irnw '.' -e "pwd" | fold -w 80 >> $file
echo "---default--------------------------------------------------" >> $file
grep -irnw '.' -e "default" | fold -w 80 >> $file
echo "---dropbear-------------------------------------------------" >> $file
grep -irnw '.' -e "dropbear" | fold -w 80 >> $file
echo "---ssl------------------------------------------------------" >> $file
grep -irnw '.' -e "ssl" | fold -w 80 >> $file
echo "---remote---------------------------------------------------" >> $file
grep -irnw '.' -e "remote" | fold -w 80 >> $file
echo "---encrypt--------------------------------------------------" >> $file
grep -irnw '.' -e "encrypt" | fold -w 80 >> $file
echo "---private--------------------------------------------------" >> $file
grep -irnw '.' -e "private" | fold -w 80 >> $file
echo >> $file
echo "------------------------------------------------------------" >> $file
echo "Search for web servers" >> $file
find . -name "lighttpd" >> $file
find . -name "alphapd" >> $file
find . -name "httpd" >> $file
echo >> $file
echo "------------------------------------------------------------" >> $file
echo "Search for important binaries" >> $file
find . -name "ssh" >> $file
find . -name "scp" >> $file
find . -name "sftp" >> $file
find . -name "tftp" >> $file
find . -name "dropbear" >> $file
find . -name "busybox" >> $file
find . -name "telnet" >> $file
