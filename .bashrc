# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l1='ls -1'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias gdb='gdb -q'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#################################################################################
# Personal customizations
#################################################################################

# Add $HOME/bin/ to our $PATH.
if [[ -d "$HOME/bin" ]]; then
	export PATH=$PATH:$HOME/bin
fi

# Add $HOME/go/bin/ to our $PATH.
if [[ -d "$HOME/go/bin" ]]; then
	export PATH=$PATH:$HOME/go/bin
fi

# Add the golang install location to our $PATH.
# https://golang.org/doc/install
if [[ -d "/usr/local/go/bin" ]]; then
	export PATH=$PATH:/usr/local/go/bin
fi

# Set $GOPATH.
# http://golang.org/doc/code.html#GOPATH
export GOPATH=$HOME/go

# Add pip local (non-system-wide) installs.
if [[ -d "$HOME/.local/bin" ]]; then
	export PATH=$PATH:$HOME/.local/bin
fi

# Set our default EDITOR
EDITOR='vim'

# So colors show up in output, e.g. ls
CLICOLOR=1;

# Longer HISTORY
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# https://github.com/junegunn/fzf
#
export FZF_DEFAULT_OPTS='--reverse --multi --height 100%'
# Include hidden files, but ignore .git/ directories.
export FZF_DEFAULT_COMMAND='find . -type f -not -path "*/\.git/*" -printf "%P\n"'
export FZF_CTRL_T_COMMAND='find . -type f -not -path "*/\.git/*" -printf "%P\n"'
# Enable keybindings (per /usr/share/doc/fzf/examples/key-bindings.bash).
#
# Docs: https://github.com/junegunn/fzf#key-bindings-for-command-line
#
#  <CTRL-t> - Paste the selected file path into the command line
#  <CTRL-r> - Paste the selected command from history into the command line
#  <ALT-c> - cd into the select directory
#
if [ -f /usr/share/doc/fzf/examples/key-bindings.bash ]; then
	source /usr/share/doc/fzf/examples/key-bindings.bash
fi
# Enable fuzzy auto-completion (per /usr/share/doc/fzf/examples/key-bindings.bash).
#
# Docs: https://github.com/junegunn/fzf#fuzzy-completion-for-bash-and-zsh
#
#   $ vim **<TAB>
#   $ cd **<TAB>
#   $ kill **<TAB>
#   $ ssh **<TAB>
#
# To change the trigger sequence from ** to something else:
#  export FZF_COMPLETION_TRIGGER='~~'
if [ -f /usr/share/doc/fzf/examples/completion.bash ]; then
	source /usr/share/doc/fzf/examples/completion.bash
fi

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

#################################################################################
# Miscellaneous
#################################################################################

# macOS only.
# https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html#index-OSTYPE.
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Silence the idiotic bash warning message: https://apple.stackexchange.com/a/371998.
    export BASH_SILENCE_DEPRECATION_WARNING=1

    # Homebrew: https://brew.sh/.
    # Install locations:
    #   Apple silicon (e.g. M1, etc.): /opt/homebrew
    #   Intel silicon: /usr/local
    HOMEBREW_PATH='/opt/homebrew/bin/brew'
    if [[ -x "${HOMEBREW_PATH:?}" ]]; then
        # Set Homebrew-related shell variables (PATH, etc.).
        eval "$(${HOMEBREW_PATH:?} shellenv)"

        # Disable analytics: https://docs.brew.sh/Analytics#opting-out.
        export HOMEBREW_NO_ANALYTICS=1

        # Enable bash-completion, https://formulae.brew.sh/formula/bash-completion.
        if [[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]]; then
            . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
        fi
    fi
fi

alias ls='ls --color=auto'

# less: Nice colors for man pages / less: https://stackoverflow.com/a/22202558
export LESS_TERMCAP_mb=$'\E[01;31m'                # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'           # begin bold
export LESS_TERMCAP_me=$'\E[0m'                    # end mode
export LESS_TERMCAP_se=$'\E[0m'                    # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'                    # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m'          # begin underline

# less:
# -j.5: show a searched for word or moved-to location in the middle of the
# visible screen. The default is to show it at the top, which is not helpful for
# context.
# R: allow ANSI escape sequences to pass through unscathed (e.g. from git
# diffs). https://stackoverflow.com/a/20414664
export LESS='R-j.5'
