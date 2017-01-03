
provision:
	vagrant plugin install vagrant-vbguest
	vagrant up --provider virtualbox
	vagrant provision
