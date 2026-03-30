#!/usr/bin/env bash

set -euo pipefail

# Determine the directory where this script is located.
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Standard stowable packages.
PACKAGES="bash conky git jj readline tmux vim"

echo "Stowing packages: $PACKAGES"
# --restow: Prune existing symlinks before stowing again (useful for updates).
# --dir: The directory where the stow packages are located.
# --target: The target directory where symlinks will be created.
stow --verbose --restow --dir="$DOTFILES_DIR" --target="$HOME" $PACKAGES

# Below this line are things that can't be done with Stow.

# MacOS.
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Configuring VS Code for macOS..."
    mkdir -p "$HOME/Library/Application Support/Code/User"
    ln -sfn "$DOTFILES_DIR/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
    ln -sfn "$DOTFILES_DIR/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
# Linux.
else
    echo "Configuring VS Code for Linux..."
    mkdir -p "$HOME/.config/Code/User"
    ln -sfn "$DOTFILES_DIR/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
    ln -sfn "$DOTFILES_DIR/vscode/keybindings.json" "$HOME/.config/Code/User/keybindings.json"

    # Load GNOME Terminal settings.
    if [[ -f "$DOTFILES_DIR/gnome/gnome-terminal.txt" ]] && command -v dconf >/dev/null 2>&1; then
        echo "Loading GNOME Terminal settings..."
        dconf load /org/gnome/terminal/legacy/profiles:/ < "$DOTFILES_DIR/gnome/gnome-terminal.txt"
    fi
fi

echo "Done!"
