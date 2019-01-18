#!/bin/sh

# Install jsctags for vim-tagbar
npm install -g jsctags

# Auto-switch to node version set in .nvmrc
# when changing directory
npm install -g avn avn-nvm
avn setup
