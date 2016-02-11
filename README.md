# firmwalker
A simple script for searching the extracted firmware file system for goodies!

The script is meant to be run inside the "rootfs" directory after the file system is extracted from the firmware and will write the data to a file one directory higher.

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

## Script created by Craig Smith
