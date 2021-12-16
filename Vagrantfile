Vagrant.configure("2") do |config|

  config.vm.box = "generic/debian10"
  config.vm.provider = "libvirt"

  # move vnc service file to /tmp and then to the proper location
  transferFile(config, "x11vnc.service", "/etc/systemd/system/")

  # port forwarding
  config.vm.network "forwarded_port", guest: 5900, host: 5900   # VNC Server (classic)

  # run provisioning script
  config.vm.provision :shell do |shell|
  	shell.path = 'provision.sh'
  end

end

# move src file (must be in data directory)
# to /tmp and then to dest in "cfg"
def transferFile(cfg, src, dest)
  cfg.vm.provision "file",
    source: "data/#{src}",
    destination: "/tmp/#{src}"
  cfg.vm.provision "shell",
    inline: "mv /tmp/#{src} #{dest}"
  return
end