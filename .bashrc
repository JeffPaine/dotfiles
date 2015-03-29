#################################################################################
# PATH
#################################################################################

# Add $HOME/bin/ to our $PATH
if [[ -d "$HOME/bin" ]]; then
	export PATH=$PATH:$HOME/bin
fi

# Add the golang install location to our $PATH
# http://golang.org/doc/install#osx
if [[ -d "/usr/local/go/bin" ]]; then
	export PATH=$PATH:/usr/local/go/bin
fi

# Set our $GOPATH
# http://golang.org/doc/code.html#GOPATH
export GOPATH=$HOME

#################################################################################
# Environment variables
#################################################################################

# Set our default EDITOR
export EDITOR='vim'

# So colors show up in output, e.g. ls
export CLICOLOR=1;

# Longer HISTORY
export HISTSIZE=10000

# Ignore duplicates in history
export HISTCONTROL=erasedups


#################################################################################
# PS1 prompt
#################################################################################

#Prompt and prompt colors
# 30m - Black
# 31m - Red
# 32m - Green
# 33m - Yellow
# 34m - Blue
# 35m - Purple
# 36m - Cyan
# 37m - White
# 0 - Normal
# 1 - Bold
function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"

  # The \ in \$(__git_ps1) is important as it causes that function to be called
  # on each new display of a prompt. Without it, it would only display on the
  # first new prompt.

  # Show git branch in PS1
  # export PS1="$GREEN\u:$RED\w$YELLOW\$(__git_ps1)\n$WHITE\\$ "

  export PS1="$GREENBOLD\u@\h$WHITEBOLD:$BLUEBOLD\w\\n$WHITE\\$ "
}

# Run the prompt function above which exports our PS1
prompt
