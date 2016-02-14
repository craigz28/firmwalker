#!/usr/bin/env bash
set -e
set -u

function usage {
	echo "Usage:"
	echo "$0 {path to extracted file system of firmware}\
 {optional: name of the file to store results - defaults to firmwalker.txt}"
	echo "Example: ./$0 linksys/fmk/rootfs/"
	exit 1
}

function msg {
    echo "$1" | tee -a $FILE
}

# Check for arguments
if [[ $# -gt 2 || $# -lt 1 ]]; then
    usage
fi

# Set variables
FIRMDIR=$1
if [[ $# -eq 2 ]]; then
    FILE=$2
else
    FILE="firmwalker.txt"
fi
# Remove previous file if it exists, is a file and doesn't point somewhere
if [[ -e "$FILE" && ! -h "$FILE" && -f "$FILE" ]]; then
    rm -f $FILE
fi

# Perform searches
msg "Firmware Directory"
msg $FIRMDIR
msg "Search for password files"
mapfile -t passfiles < "data/passfiles"
for passfile  in "${passfiles[@]}"
do
    msg "##################################### $passfile"
    find $FIRMDIR -name $passfile | cut -c${#FIRMDIR}- | tee -a $FILE
done
msg ""
if [[ -d "$FIRMDIR/etc/ssl" ]]; then
    msg "List etc/ssl directory"
    msg  "##################################### etc/ssl"
    ls -l $FIRMDIR/etc/ssl | tee -a $FILE
fi
msg ""
msg "Search for SSH authorized_keys file"
msg "#################################### SSH"
find $FIRMDIR -name "authorized_keys" | cut -c${#FIRMDIR}- | tee -a $FILE
msg ""
msg "Search for configuration files"
msg "##################################### configuration files"
mapfile -t conffiles < data/conffiles
for conffile in ${conffiles[@]}
do
    find $FIRMDIR -name "*.$conffile" | cut -c${#FIRMDIR}- | tee -a $FILE
done
msg ""
msg "Search for SSL related files"
msg "##################################### SSL files"
mapfile -t sslfiles < data/sslfiles
for sslfile in ${sslfiles[@]}
do
    find $FIRMDIR -name "*.$sslfile" | cut -c${#FIRMDIR}- | tee -a $FILE
done
msg "Search for shell scripts"
msg "##################################### shell scripts"
find $FIRMDIR -name "*.sh" | cut -c${#FIRMDIR}- | tee -a $FILE
msg ""
msg "Search for other .bin files"
msg "##################################### bin files"
find $FIRMDIR -name "*.bin" | cut -c${#FIRMDIR}- | tee -a $FILE
msg ""
msg "Search for patterns in files"
mapfile -t patterns < data/patterns
for pattern in "${patterns[@]}"
do
    msg "##################################### $pattern"
    grep -lsirnw $FIRMDIR -e "$pattern" | cut -c${#FIRMDIR}- | tee -a $FILE
done
msg ""
msg "Search for web servers" 
msg "##################################### search for web servers"
mapfile -t webservers < data/webservers
for webserver in ${webservers[@]}
do
    find $FIRMDIR -name "webserver" | cut -c${#FIRMDIR}- | tee -a $FILE
done
msg ""
msg "Search for important binaries"
msg "##################################### important binaries"
mapfile -t binaries < data/binaries
for binary in "${binaries[@]}"
do
    find $FIRMDIR -name "$binary" | cut -c${#FIRMDIR}- | tee -a $FILE
done
