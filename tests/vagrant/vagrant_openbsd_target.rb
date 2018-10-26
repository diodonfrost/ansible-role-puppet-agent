Vagrant.configure(2) do |config|
  config.vm.provision "shell", inline: <<-SHELL
     pkg_add -z ansible
     ln -s /usr/local/bin/python2.7 /usr/bin/python
  SHELL
end
