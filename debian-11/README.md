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