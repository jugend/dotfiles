#!/usr/bin/env bash

function setup() {
  for file in {aliases,bash_profile,bash_prompt,bashrc,ctags,functions,git_completion,gitconfig,gitignore,inputrc,node-inspectorrc,slate,tmux.conf,vimrc,vimrc.bundles,eslintrc,tern-project,agignore,mostrc,babelrc}; do
    if [ -r "$file" ] && [ -f "$file" ]; then
      echo "Link ~/.$file -> $PWD/$file"
      ln -sf $PWD/$file ~/.$file
    fi;
  done;

  echo ""

  [ -d ~/.vim ] || mkdir .vim
  for dir in {tmuxinator,cheat,vim/UltiSnips,vim/colors,vim/autoload}; do
    [ -d ~/.vim ] || mkdir .vim
    if [ -d "$dir" ]; then
      echo "Link ~/.$dir -> $PWD/$dir"
      ln -sfn $PWD/$dir ~/.$dir
    fi;
  done;

  file=editorconfig
  if [ -r "vim/$file" ] && [ -f "vim/$file" ]; then
    echo "Link ~/.vim/.$file -> $PWD/$file"
    ln -sf $PWD/vim/$file ~/.vim/.$file
  fi;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  setup;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    setup;
  fi;
fi;
unset setup;
