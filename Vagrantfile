# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "zone1" do |zone1|
	  zone1.vm.box = "bento/centos-6.7"
	  zone1.vm.network "forwarded_port", guest: 80, host: 8080
	  zone1.vm.network "forwarded_port", guest: 1247, host: 1501
	  zone1.vm.provision :ansible do |ansible|
		  ansible.playbook = "playbook-genkeys.yml"
	  end
	  zone1.vm.provision :ansible do |ansible|
		  ansible.playbook = "playbook_zone1.yml"
	  end
	  zone1.vm.network "private_network", ip: "10.2.2.2"
  end

  config.vm.define "zone2" do |zone2|
	  zone2.vm.box = "bento/centos-6.7"
	  zone2.vm.network "forwarded_port", guest: 80, host: 8081
	  zone2.vm.network "forwarded_port", guest: 1247, host: 1502
	  zone2.vm.provision :ansible do |ansible|
		  ansible.playbook = "playbook_zone2.yml"
	  end
	  zone2.vm.network "private_network", ip: "10.2.2.4"
  end

end
