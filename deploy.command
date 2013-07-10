vagrant up --provider=digital_ocean --no-provision
vagrant ssh-config | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' >> provisioning/ansible_hosts
ansible-playbook provisioning/default.yml -i provisioning/ansible_hosts --private-key=~/.ssh/id_rsa_gint
ansible-playbook provisioning/stocksystem.yml -i provisioning/ansible_hosts -c ssh

#ansible-playbook provisioning/vagrant-boot.yml -i provisioning/ansible_hosts --private-key=/Users/David/.vagrant.d/insecure_private_key -u vagrant -c ssh

#ansible-playbook provisioning/dev-stocksystem.yml -i provisioning/ansible_hosts -c ssh -K