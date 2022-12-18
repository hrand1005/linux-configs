#!/bin/bash
cp configs/.tmux.conf $HOME/.tmux.conf
tmux source-file $HOME/.tmux.conf
