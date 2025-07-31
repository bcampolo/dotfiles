#!/bin/bash

BRANCH=$1

cd ~/Downloads

# Update apt repo
sudo apt-get update -qq

# GIT
sudo apt-get install -yy \
  git \
  gitk
mkdir ~/git
git clone https://github.com/bcampolo/dotfiles.git ~/git/dotfiles
git --git-dir=~/git/dotfiles/.git --work-tree=~/git/dotfiles checkout $BRANCH
cp -f ~/git/dotfiles/.gitconfig ~/.gitconfig
cp -f ~/git/dotfiles/.config/git/gitk ~/.config/git/gitk

# BASHRC
cp -f ~/git/dotfiles/.bashrc ~/.bashrc

# FONTS
mkdir ~/.fonts
cp -rf ~/git/dotfiles/.fonts/ ~/.fonts/

# MARKDOWN SUPPORT ON FIREFOX
cp -f ~/git/dotfiles/.mime.types ~/.mime.types

# NODE/NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 22
nvm current

# TMUX
sudo apt-get install -yy \
  tmux \
  ripgrep \
  fzf \
  xclip
cp -f ~/git/dotfiles/.tmux.conf ~/.tmux.conf

# NEOVIM
# Backup your existing Neovim
sudo mv /opt/nvim /opt/nvim.bak
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
# Install
curl -LO https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux-x86_64.tar.gz
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo mv /opt/nvim-linux-x86_64 /opt/nvim
# Copy configuration
mkdir -p ~/.config/nvim
cp -rf ~/git/dotfiles/.config/nvim/* ~/.config/nvim/

# REST CLIENT
cp -rf ~/git/dotfiles/rest-collection ~/

# JAVA
sudo apt-get install -yy \
  openjdk-17-jdk \
  openjdk-22-jdk

# ANGULAR
# FIXME Fill in this section

# NVM
# FIXME Fill in this section

# PYENV
# FIXME Fill in this section

# BEYOND COMPARE
wget https://www.scootersoftware.com/files/bcompare-5.1.2.31185_amd64.deb
sudo apt install ./bcompare-5.1.2.31185_amd64.deb
mkdir -p ~/.config/bcompare
cp -rf ~/git/dotfiles/.config/bcompare/* ~/.config/bcompare/

# DOCKER
# Uninstall any old versions
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
# Add the docker repository to apt sources:
sudo apt-get install -yy ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
# Install docker
sudo apt-get install -yy docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# Allow non-root user to run
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

