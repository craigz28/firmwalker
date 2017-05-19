![logo](https://github.com/craigz28/firmwalker/blob/master/firmwalker-logo.jpg)
# firmwalker
A simple bash script for extracting and searching the mounted firmware file system.

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
* search for URLs, email addresses and IP addresses
* Experimental support for making calls to the Shodan API using the Shodan CLI

## Usage
* Install Binwalk before running Firmwalker `$ sudo apt-get install binwalk`
* If you wish to use the static code analysis portion of the script, please install eslint: `npm i -g eslint`
* `./firmwalker {path to the firmware} {path for firmwalker.txt}`
* Example: `./firmwalker linksys/fmk/firmware.bin ../firmwalker.txt`
* A file `firmwalker.txt` will be created in the same directory as the script file unless you specify a different filename as the second argument
* Do not put the firmwalker.sh file inside the directory to be searched, this will cause the script to search itself and the file it is creating
* `chmod 0700 firmwalker.sh`

## How to extend
* Have a look under 'data' where the checks live or add eslint rules - http://eslint.org/docs/rules/ to eslintrc.json

## Example Files - https://1drv.ms/f/s!AucQMYXJNefdvGZyeYt16H72VCLv
* squashfs-root.zip - containa files from random extracted router firmware. Firmwalker can be run against this file system.
* rt-ac66u.txt - firmwalker output file
* xc.txt - firmwalker output file from Ubiquiti device 
### Script created by Craig Smith and expanded by:
* Athanasios Kostopoulos
* misterch0c
* Yogesh Sharma
* Kumar Harsh

### Links
* https://craigsmith.net
* https://woktime.wordpress.com
* https://www.owasp.org/index.php/OWASP_Internet_of_Things_Project#tab=Firmware_Analysis
