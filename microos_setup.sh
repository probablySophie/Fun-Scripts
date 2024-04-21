# OpenSUSE's MicroOS!

# She's not actually going to install until we restart
transactional-update pkg in tmux

# Portainer!
podman volume create portainer_data # make a volume
sudo systemctl enable --now podman.socket # not 100% sure what this is
podman run \
	--rm -d -p 9443:9443 \
	--privileged --restart=always \
	-v /run/podman/podman.sock:/var/run/docker.sock:Z \
	-v portainer_data:/data \
	docker.io/portainer/portainer-ce:latest # run portainer!

# Create a symlink to the podman sock, from where the docker sock *would* be
# THIS IS CURRENTLY UNTESTED
ln -s /run/podman/podman.sock /var/run/docker.sock

# Create us a systemd service to always run portainer on boot
echo -e "[Unit] \n\
Description=Spark service \n\
\n\ 
[Service] \n\
ExecStart=/usr/bin/podman run --rm -d -p 9443:9443 --privileged --restart=always -v /run/podman/podman.sock:/var/run/docker.sock:Z -v portainer_data:/data docker.io/portainer/portainer-ce:latest \n\
\n\
[Install]\n\
WantedBy=multi-user.target\n" >> /etc/systemd/system/podman-boot.service

# Turn on that systemd service
systemctl enable podman-boot
