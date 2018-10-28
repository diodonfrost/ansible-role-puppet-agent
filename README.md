# ansible-role-puppet

[![Ansible Galaxy](https://img.shields.io/badge/galaxy-diodonfrost.puppet-660198.svg)](https://galaxy.ansible.com/diodonfrost/puppet)
[![Build Status](https://travis-ci.org/diodonfrost/ansible-role-puppet.svg?branch=master)](https://travis-ci.org/diodonfrost/ansible-role-puppet)

This role provide a compliance for puppet-agent and puppet-server on your target host.

## Requirements

This role was developed using Ansible 2.4 Backwards compatibility is not guaranteed.
Use `ansible-galaxy install diodonfrost.puppet` to install the role on your system.

Supported platforms:

```yaml
- name: EL
  versions:
    - 5
    - 6
    - 7
- name: Fedora
  versions:
    - 28
    - 27
    - 26
- name: Debian
  versions:
    - stretch
    - jessie
    - wheezy
    - squeeze
- name: Ubuntu
  versions:
    - bionic
    - artful
    - xenial
    - trusty
    - precise
- name: OracleLinux
  versions:
    - 7
    - 6
- name: Amazon
  versions:
    - all
- name: opensuse
  versions:
    - all
- name: ArchLinux
  versions:
    - any
- name: Gentoo
  versions:
    - any
- name: FreeBSD
  versions:
    - 11.0
    - 10.4
- name: OpenBSD
  versions:
    - 6.0
```

## Role Variables

This role has multiple variables. The defaults for all these variables are the following:

```yaml
---
# defaults file for ansible-role-puppet

# Install puppet agent with puppetlabs repository
# Default is true.
puppet_agent_install: true

# Install puppet server with puppetlabs repository
# puppet-server is not supported on Windows
# Default is false.
# puppet-server is not supported on Windows and OpenBSD
puppet_server_install: false

# Specify repository origin for Puppet.
# Options are 'puppetlabs_repository' or 'os_repository'.
# Default is puppetlabs_repository.
# OS supported with puppetlabs_repository:
# Redhat/CentOS 5,6,7
# Debian 6,7,8,9
# Ubuntu 18.04, 16.04, 15.04, 14.04, 12.04
# Opensuse: 42
# Windows NT: 6, 10
# Windows support only puppetlabs_repository
install_from: puppetlabs_repository

# Specifie puppet version to install
# Default is 5
puppet_version: 5

# Specifie if Puppetlabs repo source is enable
# supported value are "present" and "absent"
# Default is absent
puppetlabs_repo_source: absent
```

## Dependencies

None

## Example Playbook

This is a sample playbook file for deploying the Ansible Galaxy puppet role in a localhost and installing the open source version of puppet.

```yaml
---
- hosts: localhost
  become: true
  roles:
    - role: diodonfrost.puppet
```

## Local Testing

The preferred way of locally testing the role is to use Docker. You will have to install Docker on your system.

You can also use vagrant and Virtualbox with vagrant to run tests locally. You will have to install Virtualbox and Vagrant on your system. For all our tests we use test-kitchen.

Next install test-kitchen:

```shell
# Install dependencies
gem install bundler
bundle install
```

### Testing with Docker

```shell
# List all tests with kitchen
kitchen list

# fast test on one machine
kitchen test mariadb-103-centos-7

# test on all machines
kitchen test

# for development, create environment
kitchen create default-centos-7

# Apply ansible playbook
kitchen converge default-centos-7

# Apply inspec tests
kitchen verify default-centos-7
```

### Testing with Virtualbox

```shell
# Specify kitchen file on Linux
export KITCHEN_YAML=.kitchen-vagrant.yml

# fast test on one machine
kitchen test os-packaging-freebsd-11
```

## License

Apache 2

## Resources

Puppetlabs repo install: [https://puppet.com/docs/puppet/5.3/puppet_platform.html](https://puppet.com/docs/puppet/5.3/puppet_platform.html)

## Author Information

This role was created in 2018 by diodonfrost.
