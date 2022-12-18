#!/bin/bash
cp configs/.vimrc $HOME/.vimrc
vim +'PlugInstall -sync' +qa
vim +'source ~/.vimrc' +qa