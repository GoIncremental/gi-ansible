vagrant up --provider=digital_ocean --no-provision
vagrant ssh-config | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' >> provisioning/ansible_hosts
vagrant provision