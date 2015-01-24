#!/bin/bash

dot_files='.bash_profile
.gitconfig
.gitignore_global
.inputrc
.psqlrc
.screenrc
.tmux.conf
.vimrc'

for file in ${dot_files}; do
  if [[ -e "${HOME}/${file}" ]]; then
    rm -i "${HOME}/${file}"
  fi
  ln -s "${HOME}/.dotfiles/${file}" "${HOME}/${file}"
done
