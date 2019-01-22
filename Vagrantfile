# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  # adjust this if 10.10.11.11 is in use on your network
  config.vm.network "private_network", ip: "10.10.11.11"

  # requires plugin
  if Vagrant.has_plugin?("vagrant-disksize")
    config.disksize.size = '30GB'
  end

  config.vm.provider "virtualbox" do |vb|
  
    # Customize the amount of memory on the VM:
    vb.memory = "4096"

  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.compatibility_mode = "2.0"
    
    ansible.raw_arguments = ['-e pipelining=True']
    # enable this for better ansible debugging output
    ansible.verbose = "vv"
    ansible.extra_vars = {
      ansible_python_interpreter: "/usr/bin/python3",
      ansible_ssh_user: "vagrant"
     }

  end

  # if ENV['EVERGREEN_ENV'] != 'dev'
  #     # syncs Evergreen template files to Vagrant box
  #     # config.vm.synced_folder "src/Evergreen/Open-ILS/src/templates", "/srv/website", disabled: true
  
  #     # syncs Evergreen perl app files to Vagrant box
  #     # config.vm.synced_folder "src/Evergreen/Open-ILS/src/perlmods/lib", "/srv/website", disabled: true

  #     # syncs Evergreen web files to Vagrant box
  #     # config.vm.synced_folder "src/Evergreen/Open-ILS/src/perlmods/lib", "/openils/var/web", disabled: true
  # end

  # provisioning takes a while, it's nice to get a push notification when it's done
  # see pushover.net and https://github.com/tcnksm/vagrant-pushover
  # if you don't have this, it should skip gracefully
  if Vagrant.has_plugin?("vagrant-pushover")
    config.pushover.read_key
    config.pushover.set do |p|
       p.priority  = 1
       p.message   = "Provisioning is over."
    end
  end
end
