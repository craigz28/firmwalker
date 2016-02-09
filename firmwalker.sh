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

echo "List etc/ssl directory"
echo "---etc/ssl---" >> $file
ls -l etc/ssl >> $file

echo "--------------" >> $file
echo "Search for SSL" >> $file
find . -name "ssl" >> $file

echo "--------------" >> $file
echo "Search for SSH authorized_keys file" >> $file
find . -name "authorized_keys" >> $file

echo "--------------" >> $file
echo "Search for configuration files" >> $file
find . -name "*.conf" >> $file
find . -name "*.cfg" >> $file

echo "--------------" >> $file
echo "Search for SSL related files" >> $file
find . -name "*.pem" >> $file
find . -name "*.crt" >> $file
find . -name "*.cer" >> $file
find . -name "*.p7b" >> $file
find . -name "*.p12" >> $file

echo "--------------" >> $file
echo "Search for shell scripts" >> $file
find . -name "*.sh" >> $file

echo "--------------" >> $file
echo "Search for other .bin files" >> $file
find . -name "*.bin" >> $file

echo "--------------" >> $file
echo "Search for patterns in files" >> $file
echo "---admin---" >> $file
grep -irnw '.' -e "admin" >> $file
echo "---root---" >> $file
grep -rnw '.' -e "root" >> $file
echo "---password---" >> $file
grep -irnw '.' -e "password" >> $file
echo "---passwd---" >> $file
grep -rnw '.' -e "passwd" >> $file
echo "---pwd---" >> $file
grep -irnw '.' -e "pwd" >> $file
echo "---shadow---" >> $file
grep -rnw '.' -e "shadow" >> $file
echo "---default---" >> $file
grep -rnw '.' -e "default" >> $file

echo "--------------" >> $file
echo "Search for web servers" >> $file
find . -name "lighttpd" >> $file
find . -name "alphapd" >> $file
find . -name "httpd" >> $file
