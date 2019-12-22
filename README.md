# Ansible-role-puppet-agent

[![Build Status](https://travis-ci.org/diodonfrost/ansible-role-puppet-agent.svg?branch=master)](https://travis-ci.org/diodonfrost/ansible-role-puppet-agent)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-diodonfrost.puppet_agent-660198.svg)](https://galaxy.ansible.com/diodonfrost/puppet_agent)


This role provide a compliance for puppet-agent on your target host.

## Requirements

This role was developed using Ansible 2.4 Backwards compatibility is not guaranteed.
Use `ansible-galaxy install diodonfrost.puppet_agent` to install the role on your system.

Supported platforms:

```yaml
- name: EL
  versions:
    - 8
    - 7
    - 6
    - 5
- name: Fedora
  versions:
    - 30
    - 29
    - 28
    - 27
    - 26
- name: Debian
  versions:
    - buster
    - stretch
    - jessie
    - wheezy
    - squeeze
- name: Ubuntu
  versions:
    - bionic
    - xenial
    - trusty
    - precise
- name: OracleLinux
  versions:
    - 8
    - 7
    - 6
- name: opensuse
  versions:
    - 13.2
    - 42.1
    - 42.2
    - 42.3
- name: SLES
  versions:
    - 11
    - 12
    - 15
- name: ArchLinux
  versions:
    - any
- name: Gentoo
  versions:
    - any
- name: FreeBSD
  versions:
    - 11.2
    - 10.4
    - 10.3
- name: OpenBSD
  versions:
    - 6.0
- name: Solaris
  versions:
    - 11.0
- name: Windows
  versions:
    - 2012R2
- name: MacOSX
  versions:
    - 10.10
    - 10.11
    - 10.12
    - 10.13
```
## Role Variables

This role has multiple variables. The defaults for all these variables are the following:

```yaml
---
# defaults file for ansible-role-puppet

# Specify repository origin for Puppet.
# Options are 'puppetlabs_repository' or 'os_repository'.
# Default is puppetlabs_repository.
# OS supported with puppetlabs_repository:
# Redhat/CentOS 5,6,7
# Debian 6,7,8,9
# Ubuntu 18.04, 16.04, 15.04, 14.04, 12.04
# Opensuse: 42
# Windows NT: 6, 10
# osx: 10.10, 10.11, 10.12, 10.13
# Windows and Mac osx support only puppetlabs_repository
install_from: puppetlabs_repository

# Specifie puppet version to install
# Supported values are "5" and "6"
# Only recent Linux distribution support Puppet 6
# Default is 5
puppet_version: "5"

# Specifie if Puppetlabs repo source is enable
# Supported values are "present" and "absent"
# Default is absent
puppetlabs_repo_source: absent

# Install puppet agent with puppetlabs repository
# Default is true.
puppet_agent_install: true

# Setting up puppet_agent
# Default is true
puppet_agent_configuration: true

# The master server to request configurations from.
# Defaults to puppet
puppet_agent_server: puppet

# The environment to request when contacting the master.
# Default is production
puppet_agent_environment: production

# How often to do a Puppet run, when running as a service.
# Default is 30m
puppet_agent_runinterval: 30m

# Add advanced Puppet settings.
# Example:
# puppet_agent_custom_options:
#   - noop = enabled
#   - report = true
#   - daemonize = false
puppet_agent_custom_options:
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
    - role: diodonfrost.puppet_agent
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

### Testing Windows or Solaris with Virtualbox

Windows can only be test with Virtualbox provider,do not use 'kitchen test' command for testing Windows environment. There 4 major commands you will be using with test-kitchen as part of your workflow.

First of all we must set the kitchen file:
```shell
# For testing Windows
export KITCHEN_YAML=.kitchen-windows.yml

# For testing Solaris
export KITCHEN_YAML=.kitchen-solaris.yml
```

Provision the virtual machines, a Linux machine to run Ansible and Windows machines to apply playbook against:
```shell
# deploy machines
kitchen create

# Apply playbook
kitchen converge
```

Finaly launch inspec tests:
```shell
kitchen verify
```

For cleaning environment use:
```shell
kitchen destroy
```

## License

Apache 2

## Resources

Puppetlabs repo install: [https://puppet.com/docs/puppet/5.3/puppet_platform.html](https://puppet.com/docs/puppet/5.3/puppet_platform.html)

## Author Information

This role was created in 2018 by diodonfrost.
