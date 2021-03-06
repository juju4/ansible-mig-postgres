[![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)
# DEPRECATED/LOOKING FOR MAINTAINERS -> archived

[![Build Status](https://travis-ci.org/juju4/ansible-mig-postgres.svg?branch=master)](https://travis-ci.org/juju4/ansible-mig-postgres)

# MIG ansible role: postgres

Ansible role to setup MIG aka Mozilla InvestiGator: postgresql server
Refer to [mig master role](https://github.com/juju4/ansible-mig) for complete integration.
http://mig.mozilla.org/

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0
 * 2.5

### Operating systems

Tested on Ubuntu 14.04, 16.04, 18.04 and centos7

## Example Playbook

Just include this role in your list.

## Variables

There is a good number of variables to set the different settings of MIG. Both API and RabbitMQ hosts should be accessible to clients.
Some like password should be stored in ansible vault for production systems at least.

```
mig_user: "{{ ansible_ssh_user }}"

mig_db_migadmin_pass: xxx
mig_db_migapi_pass: xxx
mig_db_migscheduler_pass: xxx

```

## Continuous integration


This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).
Default kitchen config (.kitchen.yml) is lxd-based, while (.kitchen.vagrant.yml) is vagrant/virtualbox based.

Once you ensured all necessary roles are present, You can test with:
```
$ gem install kitchen-ansible kitchen-lxd_cli kitchen-sync kitchen-vagrant
$ cd /path/to/roles/juju4.mig-postres
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/juju4.mig-postres/test/vagrant
$ vagrant up
$ vagrant ssh
```


## Troubleshooting & Known issues

* Idempotence: NOK because of 
 - go get (x2)
 - some rabbitmq module tasks (x4) 
 - force restart of some service else handlers seems to miss it (x3)

* memory
Ensure you have enough memory and swap available. On vagrant 512M+swap or 1024M seems to be fine.

* Ubuntu 18.04/Postgresql 10 requires [ansible 2.6](https://github.com/ansible/ansible/issues/25823) so user creation set with encrypted=yes.

## License

BSD 2-clause



