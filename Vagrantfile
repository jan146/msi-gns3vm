Vagrant.configure("2") do |config|

  config.vm.box = "generic/debian10"
  config.vm.provider = "libvirt"

  # run provisioning script
  config.vm.provision :shell do |shell|
  	shell.path = 'provision.sh'
  end

end
