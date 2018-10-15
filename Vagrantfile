# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.define "xv6-sandbox"

  config.vm.synced_folder "./src", "/home/vagrant/src"

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y build-essential gdb libgmp3-dev libmpfr-dev libmpfr4 libmpfr4-dbg mpc qemu
  SHELL
end
