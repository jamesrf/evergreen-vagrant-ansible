# Evergreen Vagrant Ansible

## What it is

Automatically builds and installs Evergreen on a Vagrant VM with one command.

Problems?  Open an Issue above by clicking on "Issues".

PRs welcome!

## Requirements

- Vagrant: https://www.vagrantup.com/downloads.html
- Virtualbox: https://www.virtualbox.org/
- Ansible: http://docs.ansible.com/ansible/latest/intro_installation.html

Note: This probably won't work on Windows

## How to use

1. Open your good old fashioned terminal
2. Clone this repo: `git clone https://github.com/jamesrf/evergreen-vagrant-ansible`
3. Enter the repo directory: `cd evergreen-vagrant-ansible`
4. Run `vagrant up` 
  - it may take some time the first time you run it to download the base box
  - it takes about 20-30m on my machine to run the provisioning, times will vary depending on your machine's speed and internet connection
  
5. Your evergreen is now at https://10.10.11.11
6. Default admin login is admin/pass123


## Gotchas

If 10.10.11.11 address is in use in your environment, you can modify this in the Vagrantfile

By default the VM is configured to use 4GB of RAM.  You may want to adjust this in the Vagrantfile if you don't have that much memory.  In my testing, 2GB did not work well.

You can adjust some settings by looking in `provisioning/group_vars/main.yml`.  I recommend you run `vagrant destroy` and then `vagrant up` as you may have trouble if you try to reprovision an existing machine.

The ansible scripts in `/provisioning` can be repurposed for provisioning on bare metal.  See ansible documentation for details.

## Notes/TODO
- Clean up!  This was just a spike project, it's a mess!
- Build from a specified git branch rather than the tarball
- Ability to install developer tools (Grunt,etc)
- Explicitly state dependencies rather than running Makefile.install
- Support other than Debian Jessie
- Extra bits like reporter, etc.
- better role isolation so you could run a playbook something like this:
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

