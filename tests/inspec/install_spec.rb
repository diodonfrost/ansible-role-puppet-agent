# Puppet install

puppet_package = 'puppet-agent'

control 'install-01' do
  impact 1.0
  title 'Puppet-agent package'
  desc 'Puppet-agent should be installed'
  describe package(puppet_package) do
    it { should be_installed }
  end
end
