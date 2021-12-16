Vagrant.configure("2") do |config|

  config.vm.box = "generic/debian10"
  config.vm.provider = "libvirt"

  # move the service files to /tmp and then to the proper location
  $systemd_dir = "/etc/systemd/system/"
  transferFile(config, "x11vnc.service", $systemd_dir)
  transferFile(config, "novnc.service", $systemd_dir)
  transferFile(config, "gns3server.service", $systemd_dir)

  # transfer gns3 config files
  $gns3_config_dir = "/home/vagrant/.config/GNS3/2.2/"
  config.vm.provision "shell",
    inline: "mkdir -p #{$gns3_config_dir}"
  transferFile(config, "gns3_server.conf", $gns3_config_dir)
  transferFile(config, "gns3_gui.conf", $gns3_config_dir)

  # port forwarding
  config.vm.network "forwarded_port", guest: 5900, host: 5900   # VNC Server (classic)
  config.vm.network "forwarded_port", guest: 5901, host: 5901   # VNC Server (HTML client, SSL secure)
  config.vm.network "forwarded_port", guest: 3080, host: 3080   # GNS3 Server

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