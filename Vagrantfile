BOX="ubuntu/focal64"
BOX_URL="ubuntu/focal64"
ANSIBLE="ansi"
WORDPRESS="wordpress"
RAM=1024
PROC=1

Vagrant.configure("2") do |config|
    config.vm.box = BOX
    config.vm.box_url = BOX_URL
    config.ssh.insert_key = false
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.provider :virtualbox do |vb| 
        vb.memory = RAM
        vb.cpus = PROC
    end

    config.vm.define "Ansible" do |ansi|
        ansi.vm.hostname = ANSIBLE
        ansi.vm.network :private_network, ip: "192.168.42.100"
        ansi.vm.provider "virtual box" do |vb|
            vb.name = "ansible"
        end
    end

    # config.vm.define "Wordpress" do |wp|
    #     wp.vm.hostname = WORDPRESS
    #     wp.vm.network :private_network, ip: "192.168.42.101"
    #     wp.vm.provider "virtual box" do |vb|
    #         vb.name = "wordpress"
    #     end
    # end
end