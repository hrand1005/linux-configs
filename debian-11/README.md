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
