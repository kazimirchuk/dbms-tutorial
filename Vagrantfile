# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.33.16"
  config.vm.synced_folder "./", "/home/vagrant/", create: true
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
  end
  config.vm.provision "shell" do |s|
    s.path="setup.sh"
  end
end
