#!/bin/sh

# To fix UNABLE_TO_GET_ISSUER_CERTIFICATE_LOCALLY due to proxy server setup 
npm config set strict-ssl false

# Install jsctags for vim-tagbar
npm install -g jsctags

# Auto-switch to node version set in .nvmrc
# when changing directory
npm install -g avn avn-nvm
avn setup

# Vim instant markdown preview
npm install -g instant-markdown-d

npm install -g nodemon

# Used by vim-ale
npm install -g fixjson
