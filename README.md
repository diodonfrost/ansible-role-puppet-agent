# Ansible-role-puppet-agent

[![molecule](https://github.com/diodonfrost/ansible-role-puppet-agent/workflows/molecule/badge.svg)](https://github.com/diodonfrost/ansible-role-puppet-agent/actions)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-diodonfrost.puppet_agent-660198.svg)](https://galaxy.ansible.com/diodonfrost/puppet_agent)


This role provide a compliance for puppet-agent on your target host.

## Requirements

This role was developed using Ansible 2.4 Backwards compatibility is not guaranteed.
Use `ansible-galaxy install diodonfrost.puppet_agent` to install the role on your system.

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

This project uses [Molecule](http://molecule.readthedocs.io/) to aid in the
development and testing.

To develop or test you'll need to have installed the following:

* Linux (e.g. [Ubuntu](http://www.ubuntu.com/))
* [Docker](https://www.docker.com/)
* [Python](https://www.python.org/) (including python-pip)
* [Ansible](https://www.ansible.com/)
* [Molecule](http://molecule.readthedocs.io/)
* [Virtualbox](https://www.virtualbox.org/) (windows/bsd test only)
* [Vagrant](https://www.vagrantup.com/downloads.html) (windows/bsd test only)

### Testing with Docker

```shell
# Install requirements
pip install -r requirements-dev.txt

# Test ansible role with centos 8
molecule test

# Test ansible role with ubuntu 20.04
image=ansible-ubuntu:20.04 molecule test

# Test ansible role with alpine latest
image=ansible-alpine:latest molecule test

# Create centos 8 instance
molecule create

# Apply role on centos 8 instance
molecule converge

# Launch tests on centos 8 instance
molecule verify
```

### Testing with Vagrant and Virtualbox

```shell
# Test ansible role with FreeBSD
molecule test -s freebsd

# Test ansible role with OpenBSD
molecule test -s openbsd

# Test ansible role with Solaris
molecule test -s solaris

# Test ansible role with Windows
molecule test -s windows
```

## License

Apache 2

## Resources

Puppetlabs repo install: [https://puppet.com/docs/puppet/5.3/puppet_platform.html](https://puppet.com/docs/puppet/5.3/puppet_platform.html)

## Author Information

This role was created in 2018 by diodonfrost.
