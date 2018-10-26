# Puppet install

puppet_package = 'puppet-agent'
puppet_package = 'puppet' if os.name =='arch'
puppet_package = 'app-admin/puppet' if os.name == 'gentoo'

control 'install-01' do
  impact 1.0
  title 'Puppet-agent package'
  desc 'Puppet-agent should be installed'
  describe package(puppet_package) do
    it { should be_installed }
  end
end
