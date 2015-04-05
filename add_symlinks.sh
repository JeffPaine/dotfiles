#!/bin/bash

dot_files='.bash_profile
.bashrc
.gitconfig
.gitignore_global
.i3/config
.i3status.conf
.inputrc
.psqlrc
.screenrc
.tmux.conf
.vimrc'

for file in ${dot_files}; do
  # Check that our file exists and that it is not a symbolic link.
  if [[ -e "${HOME}/${file}" ]] && ! [[ -L "${HOME}/${file}" ]]; then
    echo "Deleting ${file} to replace with symlink"
    rm -i "${HOME}/${file}"
  fi
  if ! [[ -L "${HOME}/${file}" ]]; then
    echo "Symlinking ${HOME}/.dotfiles/${file} to ${HOME}/${file}"
    ln -s "${HOME}/.dotfiles/${file}" "${HOME}/${file}"
  fi
done
