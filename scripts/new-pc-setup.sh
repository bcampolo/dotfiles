#!/bin/bash

BRANCH=$1

cd /tmp

# Update apt repo
sudo apt-get update -qq

# GENERAL TOOLS
sudo apt-get install -yy \
  ca-certificates \
  curl \
  jq

# GIT
sudo apt-get install -yy \
  git \
  gitk
mkdir ~/git
git clone https://github.com/bcampolo/dotfiles.git ~/git/dotfiles
git --git-dir=~/git/dotfiles/.git --work-tree=~/git/dotfiles checkout $BRANCH
cp -f ~/git/dotfiles/.gitconfig ~/.gitconfig
cp -f ~/git/dotfiles/.config/git/gitk ~/.config/git/gitk
# Git credential manager
sudo apt-get install -yy \
  libsecret-1-0 \
  libsecret-1-dev
sudo make --directory=/usr/share/doc/git/contrib/credential/libsecret
git config --global credential.helper /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret

# FONTS
mkdir ~/.fonts
cp -rf ~/git/dotfiles/.fonts/* ~/.fonts/

# MARKDOWN SUPPORT ON FIREFOX
cp -f ~/git/dotfiles/.mime.types ~/.mime.types

# NODE/NPM/NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
pushd ~
nvm install 22
node -v
nvm current
npm -v
popd

# TMUX
sudo apt-get install -yy \
  tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp -f ~/git/dotfiles/.tmux.conf ~/.tmux.conf

# NEOVIM
# Backup your existing Neovim
sudo mv /opt/nvim /opt/nvim.bak
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
# Prerequisites
sudo apt install -yy \
  luarocks \
  ripgrep \
  fd-find \
  fzf \
  xclip \
  python3.12-venv
wget -qO- https://astral.sh/uv/install.sh | sh # installs uvx - needed for MCP Hub
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
  openjdk-21-jdk
sudo update-java-alternatives --set /usr/lib/jvm/java-1.21.0-openjdk-amd64

# BASHRC
cp -f ~/git/dotfiles/.bashrc ~/.bashrc
source ~/.bashrc

# PYENV
curl -fsSL https://pyenv.run | bash
pushd ~
pyenv install 3.11
popd
source ~/.bashrc

# ANGULAR
sudo npm install -g @angular/cli
source ~/.bashrc

# BEYOND COMPARE
wget https://www.scootersoftware.com/files/bcompare-5.1.2.31185_amd64.deb
sudo apt install -yy "./bcompare-5.1.2.31185_amd64.deb"
mkdir -p ~/.config/bcompare
cp -rf ~/git/dotfiles/.config/bcompare/* ~/.config/bcompare/

# DOCKER
# Uninstall any old versions
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
# Add the docker repository to apt sources:
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

# CA CERTS
# Placeholder

# REQUIRES INTERACTION
sudo apt-get install -yy \
  gh
gh auth login
