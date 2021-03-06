## Unix Environment Setup

The `config` folder contains environment configuration files for:
* bash
* vim
* git

To configure your environment, first clone this repo, then run the `install-env.sh` script:
```bash
git clone https://github.com/acrenwelge/bash-stuff.git
cd bash-stuff
./install-env.sh
```

By default the script will install the files to your home directory - you can override this location with 
an argument to the script.

### Utility Command Setup

The `utils` folder contains several custom utilities:
* `cf` - for creating files with boilerplate code (bash, java, python, html)
* `addMem` - for creating and activating swap files for extra memory on Linux machines
* `dockersetup` - script for post-docker installation (so there's no need for `sudo` with `docker`)
* `mkec2` - spin up an Amazon Linux EC2 instance on AWS
* `mkgcpvm` - spin up a Linux VM on GCP
* `pubip` - retrieve your public IP address
* `mans` - search through `man` pages for whatever argument is given

Simply run the `install-utils.sh` script to install the above utilities:
```bash
./install-utils.sh
```
