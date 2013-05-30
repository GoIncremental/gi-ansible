# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    
  config.vm.provider :virtualbox do |vb, override|
    vb.customize ['modifyvm', :id, '--memory', '512']
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

  config.vm.provision :ansible do |ansible|
    # point Vagrant at the location of your playbook you want to run
    ansible.playbook = "provisioning/default.yml"
    ansible.inventory_file = "provisioning/ansible_hosts"
    # the Vagrant VM will be put in this host group change this should
    # match the host group in your playbook you want to test
    ansible.hosts = "digitalocean"
  end

end
