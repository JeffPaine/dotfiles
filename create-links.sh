#!/usr/bin/env bash

set -e  # Exit if any commands have a non-zero status.
set -u  # Exit if a referenced variable does not exist.
set -o pipefail  # Don't hide errors in pipelines.
set -x  # Print executed commands.

if [ ! -d "${HOME}/.dotfiles" ]; then
    echo "ERROR: ${HOME}/.dotfiles must exist"
    exit 1
fi

rm -f ${HOME}/.bash_profile
rm -f ${HOME}/.bashrc
rm -f ${HOME}/.conkyrc
rm -f ${HOME}/.gitconfig
rm -f ${HOME}/.gitignore_global
rm -f ${HOME}/.inputrc
rm -f ${HOME}/.tmux.conf
rm -f ${HOME}/.vimrc

ln -s ${HOME}/.dotfiles/.bash_profile ${HOME}/.bash_profile
ln -s ${HOME}/.dotfiles/.bashrc ${HOME}/.bashrc
ln -s ${HOME}/.dotfiles/.conkyrc ${HOME}/.conkyrc
ln -s ${HOME}/.dotfiles/.gitconfig ${HOME}/.gitconfig
ln -s ${HOME}/.dotfiles/.gitignore_global ${HOME}/.gitignore_global
ln -s ${HOME}/.dotfiles/.inputrc ${HOME}/.inputrc
ln -s ${HOME}/.dotfiles/.tmux.conf ${HOME}/.tmux.conf
ln -s ${HOME}/.dotfiles/.vimrc ${HOME}/.vimrc

# File paths that vary with OS.
# https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html#index-OSTYPE.
#
# macOS.
if [[ "${OSTYPE:?}" == "darwin"* ]]; then
    rm -f "${HOME}/Library/Application\ Support/Code/User/settings.json"
    rm -f "${HOME}/Library/Application\ Support/Code/User/keybindings.json"

    mkdir -p "${HOME}/Library/Application\ Support/Code/User/"

    ln -s "${HOME}/.dotfiles/vscode/settings.json" "${HOME}/Library/Application\ Support/Code/User/settings.json"
    ln -s "${HOME}/.dotfiles/vscode/keybindings.json" "${HOME}/Library/Application\ Support/Code/User/keybindings.json"
# Linux.
else
    rm -f "${HOME}/.config/Code/User/settings.json"
    rm -f "${HOME}/.config/Code/User/keybindings.json"

    mkdir -p "${HOME}/.config/Code/User"

    ln -s "${HOME}/.dotfiles/vscode/settings.json" "${HOME}/.config/Code/User/settings.json"
    ln -s "${hOME}/.dotfiles/vscode/keybindings.json" "${HOME}/.config/Code/User/keybindings.json"
fi
