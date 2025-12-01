# Setup Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" 

# Setup nvm
brew install nvm

# Setup rvm
# curl -sSL https://get.rvm.io | bash -s stable --ruby

# Enable drag window by press Ctrl+Cmd+Click anywhere in the window
defaults write -g NSWindowShouldDragOnGesture -bool true 
