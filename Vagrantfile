# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/centos-6.5"
  config.vm.network "forwarded_port", guest: 80, host: 8889
  config.vm.provision :ansible do |ansible|
	  ansible.playbook = "playbook.yml"
  end
end
