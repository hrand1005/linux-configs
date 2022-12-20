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


