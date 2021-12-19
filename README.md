# msi-gns3vm
Automated virtual machine creation with
<a href="https://github.com/hashicorp/vagrant">Vagrant</a> and
<a href="https://github.com/canonical/cloud-init">cloud-init</a>.<br>
The former allows you to provision fully functional virtual machine
with a preconfigured gns3 and remote desktop installation,<br>
whereas the latter allows you to do the same thing on a multitude of
cloud hosting providers 
(see the *Clouds* section of the 
<a href="https://cloudinit.readthedocs.io/en/latest/topics/availability.html">cloud-init docs</a> 
for an accurate list).

# Vagrant
### Prerequisites
- <a href="https://www.vagrantup.com/downloads">install Vagrant</a> on your device
- install the libvirt provider plugin (see the [provider subsection](README.md#Vagrant%20provider) for more details).
- have <a href="https://github.com/git-guides/install-git">git</a> installed and configured

### Vagrant provider
You can install the recommended `libvirt` provider by running `vagrant plugin install vagrant-libvirt`, however you can also override this option by passing the `--provider` parameter when running `vagrant up`.

### Running the VM
To start the VM, run this in your terminal:
```bash
git clone https://github.com/jan146/msi-gns3vm.git    # clone the repository
cd msi-gns3vm/vagrant                                 # move to the vagrant directory
vagrant up                                            # start the VM
```
After executing the commands above, the VM should start with the provisioning stage.<br>
When the provisioning finishes, you will see an output of something like this:<br>

<p align="center">
	<img src="https://user-images.githubusercontent.com/51584002/146689614-d43e5c04-6442-47f4-9239-deba528123f9.png" width=80%>
</p>

You can continue with the [RDP section](README.md#Accessing%20the%20remote%desktop)

# Accessing the remote desktop
Now you can access the VM via your web browser. Head to https://localhost:5901/vnc.html or replace `localhost` with the appropriate IP address, if you're running this on a remote server.<br>
*Note:* Some browsers may block the connection because the SSL certificate is self-signed, so you might have to click some additional buttons to access the noVNC panel:

<p align="center">
	<img src="https://user-images.githubusercontent.com/51584002/146689712-da422f15-2ba7-43d0-920f-86dc346ce8e6.png" width=50%>
</p>

After that, enter the VNC server password (see [passwords subsection](README.md#Changing%20passwords) for details) and click *Connect*.<br>
You should now see something like this (Vagrant):

<p align="center">
	<img src ="https://user-images.githubusercontent.com/51584002/146690452-568557cb-112b-49ad-bea3-b8360e0dd712.png" width=50%>
</p>

or something like this (cloud-init):

<p align="center">
	<img src="https://user-images.githubusercontent.com/51584002/146690710-168b5043-60a9-43c9-b31a-98de95fbe236.png" width=50%>
</p>

If you're using Vagrant, enter the credentials (defaults: `username=vagrant` and `password=vagrant`)
and if you're using cloud-init, select the user `user` and enter the password (default: `ubuntu`).

You can continue with the [DE section](README.md/Using%20the%20desktop%20environment)

# Using the desktop environment
When you start the desktop environment for the first time, you may see a window like this pop up:
<p align="center">
	<img src ="https://user-images.githubusercontent.com/51584002/146691060-f7ffd41d-2fa6-40f8-8fca-f9dadf101b5e.png" width=30%>
</p>

Click `Use default config` to proceed.<br>
Now you should see a desktop that looks something like this:

<p align="center">
	<img src="https://user-images.githubusercontent.com/51584002/146691248-c4684d40-4de2-477b-97dc-70f703198209.png" width=50%>
</p>

The desktop icons and the dock contain essential tools like the GNS3 gui, Wireshark, a minimal web browser (Midori), a file manager, an application finder ...

# Changing passwords
Everything is preconfigured to have a short, easy to remember password out of the box:

- VNC server: `vncpass1`
- Vagrant user: `vagrant`
- Cloud-init user: `ubuntu`

However it is very recommended to change them to something more robust. You can do this by SSH-ing into the VM (`vagrant ssh` for Vagrant and `ssh user@cloud_ip` for cloud-init, but replace `cloud_ip` with the IP address of the server) or by opening a terminal in the desktop environment and doing the following:

- VNC server: `sudo x11vnc -storepasswd new_password /root/.vnc/passwd` (replace `new_password` with a sensible password)
- Vagrant user: `sudo passwd vagrant` and enter a new password when prompted
- Cloud-init user: `sudo passwd user` and enter a new password when prompted
