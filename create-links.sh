#!/usr/bin/env bash

set -e  # Exit if any commands have a non-zero status.
set -u  # Exit if a referenced variable does not exist.
set -o pipefail  # Don't hide errors in pipelines.
set -x  # Print executed commands.

[ -f ${HOME}/.bash_profile ] || ln -s $(PWD)/.bash_profile ${HOME}/.bash_profile
[ -f ${HOME}/.bashrc ] || ln -s $(PWD)/.bashrc ${HOME}/.bashrc
[ -f ${HOME}/.conkyrc ] || ln -s $(PWD)/.conkyrc ${HOME}/.conkyrc
[ -f ${HOME}/.gitconfig ] || ln -s $(PWD)/.gitconfig ${HOME}/.gitconfig
[ -f ${HOME}/.gitignore_global ] || ln -s $(PWD)/.gitignore_global ${HOME}/.gitignore_global
[ -f ${HOME}/.inputrc ] || ln -s $(PWD)/.inputrc ${HOME}/.inputrc
[ -f ${HOME}/.tmux.conf ] || ln -s $(PWD)/.tmux.conf ${HOME}/.tmux.conf
[ -f ${HOME}/.vimrc ] || ln -s $(PWD)/.vimrc ${HOME}/.vimrc

# File paths that vary with OS.
# https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html#index-OSTYPE.
if [[ "${OSTYPE:?}" == "darwin"* ]]; then
    # macOS.
    [ -f ${HOME}/Library/Application\ Support/Code/User/settings.json ] || ln -s $(PWD)/vscode/settings.json ${HOME}/Library/Application\ Support/Code/User/settings.json
else
    # Assume Linux otherwise.
    [ -d ${HOME}/.config/Code/User/ ] || mkdir -p ${HOME}/.config/Code/User
    [ -f ${HOME}/.config/Code/User/settings.json ] || ln -s $(PWD)/vscode/settings.json ${HOME}/.config/Code/User/settings.json
fi