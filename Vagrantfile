# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "master" do |master|
	  master.vm.box = "chef/centos-6.5"
	  master.vm.network "forwarded_port", guest: 80, host: 8080
	  master.vm.network "forwarded_port", guest: 1247, host: 1247
	  master.vm.provision :ansible do |ansible|
		  ansible.playbook = "playbook-master.yml"
	  end
	  master.vm.network "private_network", ip: "10.2.2.1"
  end

  config.vm.define "slave" do |slave|
	  slave.vm.box = "chef/centos-6.5"
	  slave.vm.network "forwarded_port", guest: 80, host: 8081
	  slave.vm.network "forwarded_port", guest: 1248, host: 1248
	  slave.vm.provision :ansible do |ansible|
		  ansible.playbook = "playbook-slave.yml"
	  end
	  slave.vm.network "private_network", ip: "10.2.2.2"
  end

end
