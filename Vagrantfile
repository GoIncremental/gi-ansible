# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.synced_folder '.', '/vagrant', :id => 'vagrant-root', :disabled => true
  
  config.vm.provider :virtualbox do |vb, override|
    config.vm.synced_folder '../../../github.com/', '/github', :nfs => true
    override.vm.network :private_network, ip: "33.33.33.10"
    override.vm.box = "precise64"
    vb.customize ['modifyvm', :id, '--memory', '1568']
    vb.customize ['modifyvm', :id, '--cpus', 2]
  end

  # define digital ocean provider defaults
  config.vm.provider :digital_ocean do |ocean, override|

    override.ssh.private_key_path = '~/.ssh/id_rsa_gint'
    override.vm.box = "digital_ocean"
    ocean.client_id = ENV['DO_CLIENT_ID']
    ocean.api_key = ENV['DO_API_KEY']
    ocean.ssh_key_name = 'Gintellect'
    ocean.region = "Amsterdam 1"
    ocean.size = "2GB"
  end

end