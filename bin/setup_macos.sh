#!/bin/sh
#

# Create tmux-256color terminal to support italic
tic -x tmux.terminfo

# Default: 15 (225ms), last used 10 in Dec 2019
defaults write -g InitialKeyRepeat -int 9

# Speed up keyboard repeat rate
# Default: 2 (30 ms)
defaults write -g KeyRepeat -int 1

# To read
defaults read NSGlobalDomain KeyRepeat
defaults read NSGlobalDomain InitialKeyRepeat
