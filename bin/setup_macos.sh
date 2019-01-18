#!/bin/sh
#

# Create tmux-256color terminal to support italic
tic -x tmux.terminfo

# Speed up keyboard repeat rate
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10
