# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty32"

  config.ssh.insert_key = false
  
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "256"
    vb.linked_clone = true
  end

  # App server 1
  config.vm.define "app1" do |app|
    app.vm.hostname = "orc-app1.test"
    app.vm.network "private_network", ip: "192.168.60.4"
  end

  # App server 2
  config.vm.define "app2" do |app|
    app.vm.hostname = "orc-app2.test"
    app.vm.network "private_network", ip: "192.168.60.5"
  end

  # App server 3
  config.vm.define "app3" do |app|
    app.vm.hostname = "orc-app3.test"
    app.vm.network "private_network", ip: "192.168.60.6"
  end
end