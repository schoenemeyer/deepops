#!/bin/bash
set -xe

# update apt
sudo apt update

# install build-essential tools
sudo apt install build-essential

cd ..

# Install ansible and ansible-galaxy roles
./scripts/setup.sh

cd virtual

# install vagrant (frozen at 2.2.3 to avoid various issues)
pushd "$(mktemp -d)"
wget https://releases.hashicorp.com/vagrant/2.2.3/vagrant_2.2.3_x86_64.deb -O vagrant.deb
sudo dpkg -i vagrant.deb
popd

# install other dependencies
sudo apt install -y sshpass

# install kvm packages
sudo apt install -y qemu-kvm libvirt-bin libvirt-dev bridge-utils libguestfs-tools
sudo apt install -y qemu ovmf virt-manager firewalld

# install vagrant plugins
vagrant plugin install vagrant-hostmanager vagrant-libvirt
vagrant plugin install vagrant-host-shell vagrant-scp vagrant-mutate


