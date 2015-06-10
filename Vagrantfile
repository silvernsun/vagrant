# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['DEFAULT_VAGRANT_PROVIDER'] = 'libvirt'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "deb8-base"

  config.vm.provider :libvirt do |libvirt|
    libvirt.host = ""
    libvirt.nested = true
  end

  config.vm.synced_folder ".", "/vagrant", type: "9p"
  config.vm.synced_folder "./data", "/server/ftp", type: "9p"
  config.vm.synced_folder './config', '/opt/config', type: "9p"

  config.vm.provision :shell, path: "config/setup.sh"
