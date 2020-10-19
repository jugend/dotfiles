# Herryanto's dotfiles
## Setup

* To setup brew, nvm, rvm, brew packages, npm packages and other settings
* Run `./bin/setup.sh`

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
