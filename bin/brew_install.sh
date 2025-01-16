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
brew install nginx
# Upgrade Mac OS bash
brew install bash
brew install bash-completion@2
# piped fuzzy selection
brew install fzf
brew install rg

# Python
brew install pipenv
brew install pyenv

# For YouCompleteMe setup
brew install cmake python go nodejs
brew install macvim
brew install llvm
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all

# If there's a clang errorr
# https://github.com/ycm-core/YouCompleteMe

# If there's c++117 error
# https://github-wiki-see.page/m/ycm-core/YouCompleteMe/wiki/FAQ#i-get-unknown-compiler---c17-filesystem-library-missing-on-macos

# Install tmux 2.9a_1, latest version 3 has issues with the configs
git clone https://github.com/Homebrew/homebrew-core.git /tmp/homebrew-core
cd /tmp/homebrew-core
git checkout c2a5cd21a94f5574458e16198f2c4a1b7a93a0c9 Formula/tmux.rb
brew install /tmp/homebrew-core/Formula/tmux.rb

# Install Java
brew tap homebrew/cask-versions
brew tap adoptopenjdk/openjdk
brew install temurin
brew install chromedriver

# Install node
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm install node 
# nvm install 12
# nvm alias default v12
