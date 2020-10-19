brew update

# Custom 24-bit tmux install is no longer required
brew install tmux
brew install ack
brew install bash-completion
brew install cheat
brew install ctags
brew install htop-osx
brew install git
brew install hub
brew install jsonpp
brew install reattach-to-user-namespace
brew install macvim --override-system-vi
brew install most
brew install the_silver_searcher
brew install tree
brew install unrar
brew install wget
brew install httpie
brew install reattach-to-user-namespace
brew install nvm
brew install pipenv
brew install vim
brew install nginx
brew install cmake

# Install older version of brew, tmux.conf currenly only works with v2.4
git clone https://github.com/Homebrew/homebrew-core.git /tmp/homebrew-core
cd /tmp/homebrew-core
git checkout 359b240959282dce71254d6b0e5210af9cedf4f6 Formula/tmux.rb
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
