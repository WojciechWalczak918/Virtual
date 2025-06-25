#!/bin/bash
USERNAME=jenkins
# add jenkins user to sudoers
su root
usermod -aG wheel $USERNAME
echo "jenkins ALL=(ALL) ALL" >> /etc/sudoers.d/jenkins
exit

sudo dnf -y install dnf-plugins-core
# docker repo
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
#start docker automatically
sudo systemctl enable --now docker
# add user to the docker group
sudo usermod -aG docker $USERNAME
# user needs to be relogged

sudo yum update
sudo yum -y install docker-compose-plugin

# install jenkins image 
docker pull jenkins/jenkins
#
mkdir jenkins_home
#14
