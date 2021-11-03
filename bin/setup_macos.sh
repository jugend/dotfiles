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

# Disable accented character tooltip when press and hold a character
defaults write -g ApplePressAndHoldEnabled -bool false

# Support git auto complete
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o /usr/local/etc/bash_completion.d/git-completion.bash
