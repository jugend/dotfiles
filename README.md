# Herryanto's dotfiles
## Setup

# Will install tmux, nvm, and others
* Install brew
* Run ./bin/brew_install.sh
* Install nvm
* nvm install node
* Run ./bin/npm_install.sh
* Install rvm

## Vim Setup
* Setup Vundle
* Start vim, run :PluginList, then :PluginInstall
* Setup YouCompleteMe in ~/.vim/bundle

## Link Dotfiles
```sh
git clone https://github.com/jugend/dotfiles.git
cd dotfiles
source setup.sh
source brew.sh
```

## Local files

Local files supported:
- `aliases.local`
- `bash_profile.local`
- `tmux.conf.local`
- `vimrc.local`

## Inspired by:
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [square/maximum-awesome](https://github.com/square/maximum-awesome)
