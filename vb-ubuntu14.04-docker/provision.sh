#!/bin/sh
set -o errexit
# Optionally hide some apt warnings
# export DEBIAN_FRONTEND=noninteractive

# Update apt-cache and run basic updates
apt-get update && apt-get upgrade -y

# Set locale.
# Something in either the ubuntu-box or VirtualBox messes this up by default.
locale-gen en_US.UTF-8
tee -a /etc/environment <<-EOF
        LC_ALL="en_US.UTF-8"
EOF

# Install Docker
#################################################################
# https://docker.github.io/engine/installation/linux/ubuntulinux/
# Ensure that APT works with the https method,
# and that CA certificates are installed
apt-get install -y apt-transport-https ca-certificates
# Add the new GPG key.
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
# Add docker repository
tee /etc/apt/sources.list.d/docker.list <<-EOF
	deb https://apt.dockerproject.org/repo ubuntu-trusty main
EOF
# Update the APT package index.
apt-get update
# Purge the old repo if it exists.
apt-get purge lxc-docker
# Install the recommended packages.
apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
# Install the actual Docker-engine
apt-get install -y docker-engine
# Ubuntu < 15.04 auto-enables the docker-daemon, so no need to do anything here

# Add the default user to the docker-group (so docker can be used without sudo)
usermod -aG docker vagrant

# Install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install tools
#################################################################
# Install Chromium
apt-get install -y chromium-browser

# Install miscellaneous tools
apt-get install -y git nano

# Shut down
reboot
