# firmwalker
A simple script for searching the extracted or mounted file system of a firmware file.

It will search through the extracted or mounted file system for things of interest such as:

* etc/shadow and etc/passwd
* list out the etc/ssl directory
* search for SSL related files such as .pem, .crt, etc.
* search for configuration files
* look for script files
* search for other .bin files
* look for keywords such as admin, password, remote, etc.
* search for common web servers used on IoT devices
* search for common binaries such as ssh, tftp, dropbear, etc.

* NOTE: Some of the data written to the file may be quite verbose. It that case, the data can be reviewed and then deleted if desired from the file.

## Usage
* './firmwalker {path to root file system}'
* Example: './firmwalker linksys/fmk/rootfs'
* A file "firmwalker.txt" will be created in the same directory as the script file
* Do not put the firmwalker.sh file inside the directory to be searched, this will cause the script to search itself and the file it is creating
* chmod 700 firmwalker.sh

### Script created by Craig Smith
* https://craigsmith.net
