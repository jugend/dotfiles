#!/usr/bin/env bash

function setupLocal() {
  for file in {aliases.local,bash_profile.local,tmux.conf.local}; do
    if [ -r "$file" ] && [ -f "$file" ]; then
      echo "Link ~/.$file -> $PWD/$file"
      ln -sf $PWD/$file ~/.$file
    fi;
  done;
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
unset setupLocal;
