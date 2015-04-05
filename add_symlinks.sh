#!/bin/bash

dot_files='.bash_profile
.bashrc
.gitconfig
.gitignore_global
.i3status.conf
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
