# Evergreen Vagrant Ansible

## What it is

Automatically builds and installs Evergreen on a Vagrant VM with one command.

## Requirements

- Vagrant: https://www.vagrantup.com/downloads.html
- Virtualbox: https://www.virtualbox.org/
- Ansible: http://docs.ansible.com/ansible/latest/intro_installation.html

Note: This probably won't work on Windows

## How to use

1. Clone this repo and run `vagrant up`
2. Visit https://10.10.11.11/eg/staff
3. Login with admin/pass123
4. You've got Evergreen!  Check it out! (pun intended)

Issues? PRs?  Open an issue on this GitHub!

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

