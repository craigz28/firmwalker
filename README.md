![logo](http://share.craigz28.com/cv3N)
# firmwalker
A simple bash  script for searching the extracted or mounted firmware file system.

It will search through the extracted or mounted firmware file system for things of interest such as:

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
* A file "firmwalker.txt" will be created in the same directory as the script file unless you specify a different filename as the second argument
* Do not put the firmwalker.sh file inside the directory to be searched, this will cause the script to search itself and the file it is creating
* chmod 0700 firmwalker.sh

## How to extend
* Have a look under data where the checks live - feel free to extend as you see fit

### Script created by Craig Smith and expanded by Athanasios Kostopoulos
* https://craigsmith.net
* https://woktime.wordpress.com
* https://www.owasp.org/index.php/OWASP_Internet_of_Things_Project#tab=Firmware_Analysis
