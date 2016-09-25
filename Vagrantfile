# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
#master of puppets
	config.vm.define "puppetmaster", primary: true do |puppetmaster|
  		puppetmaster.vm.box = "bento/centos-7.2"
  		puppetmaster.vm.network "private_network", ip: "192.168.33.16"
  		puppetmaster.vm.hostname = "serverpuppet"
  		puppetmaster.vm.provider "virtualbox" do |vm1|
    			vm1.cpus = 2
    			vm1.memory = "4096"
  		end
	config.vm.synced_folder ".", "/vagrant", type: "virtualbox"	
  	config.vm.provision "shell", path: "provision.sh"
	end
#puppet slave
	config.vm.define "puppetnode", primary: true do |puppetnode|
		puppetnode.vm.box = "bento/centos-7.2"
                puppetnode.vm.network "private_network", ip: "192.168.33.17"
                puppetnode.vm.hostname = "clientpuppet"
                puppetnode.vm.provider "virtualbox" do |vm2|
                        vm2.cpus = 1
                        vm2.memory = "1024"
                end
	config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
	config.vm.provision "shell", path: "provision.sh"
	end
end
