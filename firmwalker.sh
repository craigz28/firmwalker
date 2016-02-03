#!/bin/bash
file=../firmware_search.txt
echo "Cat etc/passwd and etc/shadow" > $file
echo "---etc/passwd---" >> $file
cat etc/passwd >> $file
echo "---etc/shadow---" >> $file
cat etc/shadow >> $file
echo "---etc/ssl---" >> $file
ls -l etc/ssl >> $file

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
grep -rnw '.' -e "admin" >> $file
echo "---root---" >> $file
grep -rnw '.' -e "root" >> $file
echo "---password---" >> $file
grep -rnw '.' -e "password" >> $file
echo "---passwd---" >> $file
grep -rnw '.' -e "passwd" >> $file
echo "---shadow---" >> $file
grep -rnw '.' -e "shadow" >> $file

echo "--------------" >> $file
echo "Search for web servers" >> $file
find . -name "lighttpd" >> $file
find . -name "alphapd" >> $file
find . -name "httpd" >> $file

echo "--------------" >> $file
echo "Search for SSL" >> $file
find . -name "ssl" >> $file
