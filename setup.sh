# useful setup and installation steps
echo "\nupdate and upgrade"
apt update
apt upgrade 

echo "\nInstall and setup vim..."
apt-get -y install vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc $HOME/.vimrc
vim +'PlugInstall -sync' +qa
vim +'source ~/.vimrc' +qa

echo "\nInstall neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage

echo "\nInstalling git..."
apt-get -y install git

echo "\nInstalling vscode..."
apt-get -y install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
apt-get -y install apt-transport-https
apt update
apt-get -y install code

echo "\nInstalling go version 18.2..."
wget -c https://golang.org/dl/go1.18.2.linux-amd64.tar.gz
chmod +x go1.18.2.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.2.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin">>$HOME/.profile
rm go1.18.2.linux-amd64.tar.gz

echo "\nInstalling c#..."
# microsoft signing key and package repository or something
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
# install the .NET SDK
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-6.0
# install ASP.NET Core runtime, which takes care of pretty much all
# .NET apps, including backward compatibility with ASP.NET Core
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y aspnetcore-runtime-6.0

echo "\nInstalling build-essential"
apt install --reinstall build-essential

echo "\nInstalling i3"
apt-get -y install i3
cp i3config $HOME/.config/i3/config

echo "\nInstalling tmux"
apt-get -y install tmux
cp .tmux.conf $HOME/.tmux.conf

echo "\nInstalling feh"
apt install feh -y

echo "\nMapping caps-lock to escape"
echo "export PATH=$PATH:/usr/local/go/bin">>$HOME/.profile
setxkbmap -layout us -option caps:escape

echo "\nSource .profile"
source $HOME/.profile
