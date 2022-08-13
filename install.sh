#!/bin/bash
readonly SEPARATOR="----------\n"

echo "Update and Upgrade..."
apt update
apt upgrade 
echo $SEPARATOR

echo "Installing vim..."
apt-get -y install vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo $SEPARATOR

echo "Install neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
echo $SEPARATOR

echo "Installing git..."
apt-get -y install git
echo $SEPARATOR

echo "Installing vscode..."
apt-get -y install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
apt-get -y install apt-transport-https
apt update
apt-get -y install code
echo $SEPARATOR

echo "Installing go version 1.19..."
wget -c https://golang.org/dl/go1.19.linux-amd64.tar.gz
chmod +x go1.19.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin">>$HOME/.profile
rm go1.19.linux-amd64.tar.gz
echo $SEPARATOR

echo "Installing build-essential"
apt install --reinstall build-essential
echo $SEPARATOR

echo "Installing i3"
apt-get -y install i3
echo $SEPARATOR

echo "Installing tmux"
apt-get -y install tmux
echo $SEPARATOR

echo "Installing feh"
apt install feh -y
echo $SEPARATOR

echo "Finished"