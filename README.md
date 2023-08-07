![logo](https://github.com/craigz28/firmwalker/blob/master/firmwalker-logo.jpg)
# firmwalker
A simple ~~bash~~ Python3 script for searching the extracted or mounted firmware file system.

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

## Installing Dependencies
```bash
$ sudo apt update
$ sudo apt upgrade
$ sudo apt install python3-pip
$ pip install --upgrade pip
$ git clone https://github.com/Feehley/firmwalker.git
$ cd firmwalker
$ pip install -r requirements.txt
```

## Usage
* Help Menu
```bash
$ python3 ./firmwalker.py -h 
usage: firmwalker.py [-h] [-o OUTPUT] firmware_directory

positional arguments:
  firmware_directory

optional arguments:
  -h, --help            show this help message and exit
  -o OUTPUT, --output OUTPUT
                        Optional name of the file to store results - defaults to "firmwalker.txt"


```
* Example of writing to default output file:
``` bash
$ python3 ./firmwalker.py linksys/fmk/footfs
```
* A file `firmwalker.txt` will be created in the same directory as the script file unless you specify a different filename as the second argument
* Example of writing to a custom output file:
```bash
$ python3 ./firmwalker.py linksys/fmk/footfs -o ../firmwalker.txt
```
* Do not put the firmwalker.sh or firmwalker.py inside the directory to be searched, this will cause the script to search itself and the file it is creating
* To make the files executable:
``` bash
$ chmod 0700 firmwalker.py
```

## How to Extend
* In the data directory there are some eslint rules; use these as a template to extend functionality

## Example Files - https://1drv.ms/f/s!AucQMYXJNefdvGZyeYt16H72VCLv
* squashfs-root.zip - contains files from random extracted router firmware. Firmwalker can be run against this file system.
* rt-ac66u.txt - firmwalker output file
* xc.txt - firmwalker output file from Ubiquiti device 
### Script created by Craig Smith and expanded by:
* Athanasios Kostopoulos
* misterch0c
* Feehley

### Links
* https://craigsmith.net
* https://woktime.wordpress.com
* https://www.owasp.org/index.php/OWASP_Internet_of_Things_Project#tab=Firmware_Analysis
