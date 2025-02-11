Vagrant.configure("2") do |config|
  config.vm.box = "generic/centos9s"
  config.vm.box_version = "4.3.12"
  
  
  config.vm.network "private_network", ip: "192.168.56.1"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 44300
  config.vm.network "forwarded_port", guest: 3306, host: 33060

  config.vm.provision 'shell', path: 'provision/bitrix-install.sh', privileged: true
  config.vm.provision 'shell', reboot: true
  config.vm.provision 'shell', path: 'provision/bitrix-init.sh'
end
