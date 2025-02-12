Vagrant.configure("2") do |config|
  config.vm.box = "generic/centos9s"
  config.vm.box_version = "4.3.12"
  
  config.vm.network "private_network", ip: "192.168.56.100"
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
  config.vm.network "forwarded_port", guest: 443, host: 44300
  config.vm.network "forwarded_port", guest: 3306, host: 33060
  
  config.vm.synced_folder "www/", "/home/bitrix/www", type: "nfs", nfs_version: 3, nfs_udp: false
  config.vm.synced_folder "ext_www/", "/home/bitrix/ext_www", type: "nfs", nfs_version: 3, nfs_udp: false

  config.vm.provider :libvirt do |libvirt|
    libvirt.cpus = 1
    libvirt.memory = 1024
    libvirt.graphics_type = "none"
  end
  
  config.vm.provider "virtualbox" do |vbox|
    vbox.cpus = 1
    vbox.memory = 1024
    vbox.gui = false
  end

  config.vm.provision 'shell', path: 'provision/before-bitrix-install.sh', privileged: true
  config.vm.provision 'shell', reboot: true
  config.vm.provision 'shell', path: 'provision/bitrix-install.sh', privileged: true
  config.vm.provision 'shell', reboot: true
end
