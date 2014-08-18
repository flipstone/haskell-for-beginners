# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

FLIPSTONE_DOCKER_FILE = "#{ENV['HOME']}/.flipstone_docker_host/Vagrantfile"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "docker" do |d|
    d.cmd     = ["/sbin/my_init", "--enable-insecure-key"]
    d.image   = "flipstone/playground-haskell"
    d.has_ssh = true

    if File.exist? FLIPSTONE_DOCKER_FILE
      d.vagrant_vagrantfile = FLIPSTONE_DOCKER_FILE
    end
  end

  config.vm.boot_timeout = 10
  config.ssh.private_key_path = "phusion.key"
end
