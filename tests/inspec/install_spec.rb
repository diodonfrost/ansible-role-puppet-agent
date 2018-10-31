# Puppet install

puppet_package = 'puppet-agent'
puppet_package = 'puppet' if os.name =='arch'
puppet_package = 'app-admin/puppet' if os.name == 'gentoo'
puppet_package = 'Puppet Agent (64-bit)' if os.family == 'windows'

puppet_service = 'puppet'

control 'install-01' do
  impact 1.0
  title 'Puppet-agent package'
  desc 'Puppet-agent should be installed'
  if os.name != 'mac_os_x'
    describe package(puppet_package) do
      it { should be_installed }
    end
  else
    describe file('/opt/puppetlabs/bin/puppet') do
      it { should be_present }
    end
  end
end

control 'install-02' do
  impact 1.0
  title 'Puppet-agent service'
  desc 'Puppet-agent  service should be running and enabled'
  describe service(puppet_service) do
    it { should be_enabled }
    it { should be_running }
  end
end
