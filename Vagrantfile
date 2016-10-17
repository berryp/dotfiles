# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "terrywang/archlinux"
  config.vm.provider :virtualbox do |vb|
    vb.name = "dotfiles"
  end

  config.vm.network :forwarded_port, guest: 8000, host: 9800
  config.vm.network :forwarded_port, guest: 8080, host: 9880
  config.vm.network :forwarded_port, guest: 3000, host: 9300
  config.vm.network :forwarded_port, guest: 4000, host: 9400
  config.vm.provision "file", source: "~/.ssh/id_rsa", destination: "~/.ssh/id_rsa"
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/id_rsa.pub"

  # Map a work folder.
  if !ENV['WORKDIR']
    puts "Error: WORKDIR environment variable not set"
    exit!
  end

  config.vm.synced_folder "#{ENV['HOME']}", "/home/vagrant/work", group: "vagrant", owner: "vagrant"
end
