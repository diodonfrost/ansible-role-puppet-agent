# Puppet install

control 'install-01' do
  impact 1.0
  title 'Puppet-agent package'
  desc 'Puppet-agent should be installed'
  describe package('puppet-agent') do
    it { should be_installed }
  end
end
