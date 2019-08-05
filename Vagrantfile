# -*- mode: ruby -*-
# vi: set ft=ruby :

PRIVATE_IP = "192.168.50.4"

PRIVATE_SHARE_PATH = if Vagrant::Util::Platform.windows? 
    "\\\\#{PRIVATE_IP}\\Code"
else
    "smb://#{PRIVATE_IP}/Code"
end

Vagrant.configure("2") do |config|
  # We're on 1804 as 1904 seems to be misbehaving currently.
  config.vm.box = "generic/ubuntu1804"

  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network "forwarded_port", guest: 8069, host: 8069
  config.vm.network "forwarded_port", guest: 8072, host: 8072
  config.vm.network "forwarded_port", guest: 1984, host: 1984

  config.vm.network "private_network", ip: PRIVATE_IP

  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
  end

  config.vm.provision "shell", path: "provision.sh"

  config.vm.post_up_message = "The VM has booted. You should be able to access your VM's Code directory via #{PRIVATE_SHARE_PATH}. Use `vagrant ssh` to gain access to the VM. Checkout any code into /home/vagrant/Code to make it available via the network share."
end
