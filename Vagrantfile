# -*- mode: ruby -*-
# vi: set ft=ruby :

# get build user from keyring via shell and chomp newline character
build_user = `keyring get ffebh build-user`.chomp

Vagrant.configure("2") do |config|

  config.ssh.forward_agent = true
  config.ssh.private_key_path = "~/.ssh/id_ed25519"
  config.ssh.username = "#{build_user}"

  config.vm.box = "ffebh-test"
  config.vm.hostname = "ffebh-test"

end
