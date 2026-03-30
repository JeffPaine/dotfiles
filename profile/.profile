# ~/.profile: executed by the command interpreter for *login* shells.
#
# This file is not read by bash(1) if ~/.bash_profile or ~/.bash_login exists.
#
# NOTE:
#   * ~/.profile: should only contain baseline settings such as PATH, EDITOR, etc.
#   that should be set up as part of initial login / session start and are
#   relevant to all child processes (e.g. scripts, interactive shells, etc.).
#   * ~/.bashrc: should only contain settings relevant to interactive bash
#   shells (e.g. someone typing at the command line, so prompt customizations,
#   bash customizations, aliases, etc.).

# Add $HOME/bin/ to our $PATH.
if [ -d "$HOME/bin" ]; then
	export PATH="$PATH:$HOME/bin"
fi

# Add $HOME/go/bin/ to our $PATH.
if [ -d "$HOME/go/bin" ]; then
	export PATH="$PATH:$HOME/go/bin"
fi

# Add the golang install location to our $PATH.
# https://golang.org/doc/install
if [ -d "/usr/local/go/bin" ]; then
	export PATH="$PATH:/usr/local/go/bin"
fi

# Set $GOPATH.
# http://golang.org/doc/code.html#GOPATH
export GOPATH="$HOME/go"

# Add pip local (non-system-wide) installs.
if [ -d "$HOME/.local/bin" ]; then
	export PATH="$PATH:$HOME/.local/bin"
fi

# Set a default EDITOR.
export EDITOR='vim'

# Set a default SUDO_EDITOR.
export SUDO_EDITOR='vim'

# So colors show up in output, e.g. ls
export CLICOLOR=1

# macOS only.
# Using 'uname -s' is the POSIX-compliant way to check the OS.
if [ "$(uname -s)" = "Darwin" ]; then
	# Silence the idiotic bash warning message: https://apple.stackexchange.com/a/371998.
	export BASH_SILENCE_DEPRECATION_WARNING=1

	# Explicitly set locale settings so bash on MacOS works as expected.
	export LANG="en_US.UTF-8"
	export LC_ALL="en_US.UTF-8"

	# Homebrew: https://brew.sh/.
	# Install locations:
	#   Apple silicon (e.g. M1, etc.): /opt/homebrew
	#   Intel silicon: /usr/local
	HOMEBREW_PATH='/opt/homebrew/bin/brew'
	
	if [ -x "$HOMEBREW_PATH" ]; then
		# Set Homebrew-related shell variables (PATH, etc.).
		eval "$("$HOMEBREW_PATH" shellenv)"

		# Add gnubin to PATH to pick up GNU `tar`. See `brew info gnu-tar`.
		export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"

		# Disable analytics: https://docs.brew.sh/Analytics#opting-out.
		export HOMEBREW_NO_ANALYTICS=1

		# Enable bash-completion, https://formulae.brew.sh/formula/bash-completion.
		if [ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]; then
			. "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
		fi
	fi
fi

# Check if the current shell is bash
if [ -n "$BASH_VERSION" ]; then
	# Check if .bashrc exists, and if so, source it
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi