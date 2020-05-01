# -*- mode: ruby -*-
# vi: set ft=ruby :

build_user = $(keyring get ffebh build-user)
build_pass = $(keyring get ffebh build-password)

Vagrant.configure("2") do |config|

  config.ssh.forward_agent = true
  config.ssh.password = $build_pass
  config.ssh.private_key_path = "~/.ssh/id_ed25519"
  config.ssh.username = $build_user

  config.vm.box = "ffebh-test"
  config.vm.hostname = "ffebh-test"

end
