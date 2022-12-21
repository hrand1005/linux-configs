# Setup Log

Here are the steps I went through manually, in order.

## SSH Keys

Generate key:

```
ssh-keygen -t ed25519 -C "username@example.com"
```

Default directory, empty passphrase.

Then, add the key to the ssh-agent.
First, start the ssh-agent in the background:
```
eval "$(ssh-agent -s)"
```

Add your private key to the ssh-agent:
```
ssh-add ~/.ssh/id_ed25519
```

## Add SSH Key to Github

Copy your public key to your clipboard:
```
cat ~/.ssh/id_ed25519.pub
```

Login to Github, settings -> SSH and GPG Keys -> New SSH Key.
Name key and paste contents.

## Install Git

```
sudo apt update && sudo apt upgrade
sudo apt install git
```

## Setup tmux

Install:
```
sudo apt install tmux
```

Run setup script with personal bindings (vim):
```
./setup_tmux.sh
```

## Setup i3

Install:
```
sudo apt-get install i3
```

Logout and login with i3.

Copy configs to personal directory:
```
./setup_i3.sh
```

## Setup Neovim

Follow instructions to build and install latest stable version of neovim from source.
[Full Tutorial](https://github.com/neovim/neovim/wiki/Building-Neovim)

For debian...

1. Install prerequisites:
```
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
```

2. Clone repository:
```
git clone https://github.com/neovim/neovim
```

3. For the latest stable version, checkout the branch `stable`:
```
cd neovim 
git checkout stable
```

4. Build from root of cloned repo:
```
make CMAKE_BUILD_TYPE=RelWithDebInfo
```

5. Install:
```
sudo make install
```

Additionally, you can install the lua interpreter (not sure if bundled):
```
sudo apt install lua5.4
```

## Install Languages / Servers

Install python3-venv:
```
sudo apt-get install python3-venv
```

Install Go:

```
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.4.linux-amd64.tar.gz
```
Add the following to `~/.profile`:
```
export PATH=$PATH:/usr/local/go/bin
```

## Tmux Plugin Manager

Install from source
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Follow README.md instructions, source tmux configuration:
```
tmux source ~/.tmux.conf
```

## Picom

Install Picom from source
```
sudo apt install cmake meson git pkg-config asciidoc libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libev-dev libx11-xcb-dev
```
Clone the repo to the appropriate location:
```
git clone https://github.com/jonaburg/picom
```

To build and install:
```
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
```

copy picom configs from configs to `~/.config/picom/picom.conf`

```
cp configs/picom.conf ~/.config/picom/picom.conf
```

In order to run picom on debian, it seems it needs to use an experimental backend:
```
picom --config ~/.config/picom/picom.conf --experimental-backend -b
```

I added this to my `.xsessionrc` file as the following line:
```
picom --config $HOME/.config/picom/picom.conf --experimental-backend -b
```
