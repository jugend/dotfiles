brew update

# Custom 24-bit tmux install is no longer required
brew install ack
brew install bash-completion
brew install cheat
brew install ctags
brew install htop-osx
brew install git
brew install hub
brew install jsonpp
brew install reattach-to-user-namespace
brew install most
brew install the_silver_searcher
brew install tree
brew install unrar
brew install wget
brew install httpie
brew install reattach-to-user-namespace
brew install pipenv
brew install nginx

# For YouCompleteMe setup
brew install macvim --override-system-vi
brew install python mono go nodejs cmake

# Install tmux 2.9a_1, latest version 3 has issues with the configs
git clone https://github.com/Homebrew/homebrew-core.git /tmp/homebrew-core
cd /tmp/homebrew-core
git checkout c2a5cd21a94f5574458e16198f2c4a1b7a93a0c9 Formula/tmux.rb
brew install /tmp/homebrew-core/Formula/tmux.rb

# Install Java
brew tap homebrew/cask-versions
brew tap adoptopenjdk/openjdk
brew cask install adoptopenjdk
brew cask install chromedriver

# Install node
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm install node
nvm install 10
nvm alias default v10
