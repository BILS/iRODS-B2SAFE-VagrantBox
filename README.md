#  A Vagrant / Ansible config with iRODS4 and the B2SAFE module

![Screenshot](irods_b2safe_terminal.png)

## Introduction

This is a [Vagrant](https://www.vagrantup.com) box with
[Ansible](http://www.ansible.com) provisioning that will automatically
set up a [VirtualBox](https://www.virtualbox.org) virtual machine with
[iRODS4](http://irods.org), and the [B2SAFE](http://www.eudat.eu/b2safe)
module developed by [EUDAT](http://www.eudat.eu), for automatic
replication of data between B2SAFE-enabled iRODS zones.

This installation is an effort at documenting (with "executable code")
a pilot project within [Elixir Europe](http://www.elixir-europe.org),
for setting up a test replication of proteomics data between
[BILS](http://www.elixir-europe.org) in Sweden, and
[EBI](http://www.ebi.ac.uk) in the UK.

## Requirements

Executing this "vagrant box" requires the following softares installed:

- [Vagrant](https://www.vagrantup.com)
- [Ansible](http://www.ansible.com)
- [VirtualBox](https://www.virtualbox.org)

## Getting started

### Install dependencies

Check the websites of the various softwares under "Requirements" above, for install instructions.

### Download and start

To get started using this machine, clone this repository, and then run `vagrant up`:

```bash
git clone https://github.com/BILS/irods-b2safe-vagrant.git
cd irods-b2safe-vagrant
vagrant up
```

### Log in with SSH

To log in to one of the newly created virtual machines (zone1 or zone2), do:

```bash
vagrant ssh zone1
```
or:
```bash
vagrant ssh zone2
```
respectively.

## Optional additional steps

If wanting to allow access from one zone to another, except for the "robot"
user setup in the included ansible configuration, you will need to do the
following on both sides, for each additional user that needs/wants access:

```bash
iadmin mkgroup replicate
ichmod -r read replicate /zone1/replicate
ichmod -r write replicate /zone1/replicate
ichmod -r inherit /zone1/replicate
iadmin atg replicate [username]
```

It was also found out it is necessary for the users to have 'own' right on the replicate directory.

```bash
ichown -r own [username] /zone1/replicate
```

Same thing for the other side:
```bash
ichown -r own [username] /zone2/replicate
```


## Making sure that things work

To test that the communication with the epic client works, you can try issuing the following
command, inside one of the virtual machines:

```bash
/var/lib/irods/iRODS/modules/b2safe/cmd/epicclient.py os /var/lib/irods/b2safe/credentials test
```

## Known issues

- It can happen that the VirtualBox guest extensions suddently stops working,
  with the effect that mounting of folders from the host won't work anymore,
  and the ansible provisioning will not work.
  - This can be fixed by manually SSH:ing in to the boxes (with `vagrant ssh [boxname]` and issuing the
    following commands:
    - `sudo yum install kernel-devel-2.6.32-504.16.2.el6.x86_64`
    - `sudo yum install gcc`
	- `sudo /etc/init.d/vboxadd setup`
	- `sudo reboot now`
