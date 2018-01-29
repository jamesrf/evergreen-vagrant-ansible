# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/stretch64"

  
  # adjust this if 10.10.11.11 is in use on your network
  config.vm.network "private_network", ip: "10.10.11.11"

  config.vm.provider "virtualbox" do |vb|
  
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
  end
  
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.compatibility_mode = "2.0"
    
    # enable this for better ansible debugging output
    # ansible.verbose = "vvvv"
  end


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
