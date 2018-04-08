# Evergreen Vagrant Ansible

## What it is

Automatically builds and installs Evergreen on a fresh Debian VM with one command.

Problems?  Open an Issue above by clicking on "Issues".  PRs welcome!

## System Requirements
You must have a Mac or Linux machine.  
For Windows 10 users, you can install on Windows Subsystem for Linux.

The Virtual Machine created requires 4GB of memory.  I would recommend you have a minimum of 8GB of memory on your machine, I have only tested with 16GB.

The build process downloads a lot of packages and takes some time.  You will need a good and reliable internet connection.

By default the VM is configured to listen on 10.10.11.11.  If this address doesn't work for your network environment, you can try changing it in the Vagrantfile

## Software Dependencies

### Virtualbox
Visit https://www.virtualbox.org/ for downloads/installation instructions

### Ansible
See http://docs.ansible.com/ansible/latest/intro_installation.html for instructions

### Git
```
Ubuntu: sudo apt-get install git
Older Centos/RHEL/Fedora: sudo yum install git
Newer Centos/RHEL/Fedora: sudo dnf install git
MacOS: Should have git preinstalled
```
|   |   |
|---|---|
|   |   |

## Installation
1. Open your terminal
2. Clone this repository:`git clone https://github.com/jamesrf/evergreen-vagrant-ansible`
3. Enter the directory: `cd evergreen-vagrant-ansible`
4. Run `vagrant up` 
  - it may take some time the first time you run it to download the base box
  - it takes about 20-30m on my machine to run the provisioning, times will vary depending on your machine's speed and internet connection
5. If there is no error, congrats, you have Evergreen!

## Usage
1. Your will now be able to access Evergreen at 

|               |                              |
|---------------|------------------------------|
| OPAC          | https://10.10.11.11          |
| Staff         | https://10.10.11.11/eg/staff |

2. When visiting these pages, your browser will give you scary warnings about a self-signed certificate, you must accept these warnings in order to continue.

3. Default admin login is:

|               |         |
|---------------|---------|
| Username      | admin   |
| Password      | pass123 |

## Making changes

If you want to change how Evergreen is installed, check  `provisioning/group_vars/main.yml`.  

Due to some issues with XMPP user registration, I recommend you run `vagrant destroy` and then `vagrant up` from a clean VM.

The ansible scripts in `/provisioning` can be repurposed for provisioning on bare metal.  See ansible documentation for details.

## Notes/TODO
- Possible to create application-based roles?  ie: 
```
    - hosts: loadbalancer
      roles:
      - haproxy

    - hosts: frontend
      roles:
      - apache2
      - ejabberd
      - memcached
      - opensrf-websockets
      - opensrf-router
      - open-ils.auth
    
    - hosts: backend
      roles: 
      - open-ils.storage
      - open-ils.circ
      - open-ils.actor
      - ...etc
```

