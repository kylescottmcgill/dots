#!/usr/bin/env sh

## GENERAL OPTIONS ##

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

## SMARTER TAB-COMPLETION (Readline bindings) ##

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

## SANE HISTORY DEFAULTS ##

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

## BETTER DIRECTORY NAVIGATION ##

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projects folder
CDPATH="."

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars

# Examples:
# export dotfiles="$HOME/dotfiles"
# export projects="$HOME/projects"
# export documents="$HOME/Documents"
# export dropbox="$HOME/Dropbox"

for file in /etc/bash_completion.d/* ; do
	# shellcheck source=/dev/null
	source "$file"
done

export GPG_TTY=$(tty)
export PINENTRY_USER_DATA="USE_CURSES=1"

# Set my editor and git editor
export EDITOR="$(which nvim)"
export VISUAL_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR

# Don't check mail when opening terminal.
unset MAILCHECK

# Golang
export GOPATH=$HOME
export GOBIN=$HOME/bin

# Google Cloud SDK
export GOOGLE_CLOUD_SDK=/opt/google-cloud-sdk/bin

# Rust
export PATH="$GOBIN:$GOOGLE_CLOUD_SDK:$PATH"

# History
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

export MYSQL_HISTFILE=/dev/null
export LESSHISTFILE=/dev/null
export BZR_LOG=/dev/null

export BROWSER=chromium
export XDG_CONFIG_HOME="$HOME/.config"
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export WWW_HOME="$HOME/.cache"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export GTK_THEME="Paper"

#export GDK_SCALE=2

man() {
	export LESS_TERMCAP_mb=$'\e'"[1;31m"
	export LESS_TERMCAP_md=$'\e'"[1;31m"
	export LESS_TERMCAP_me=$'\e'"[0m"
	export LESS_TERMCAP_se=$'\e'"[0m"
	export LESS_TERMCAP_so=$'\e'"[1;44;33m"
	export LESS_TERMCAP_ue=$'\e'"[0m"
	export LESS_TERMCAP_us=$'\e'"[1;32m"
	command man $@
}

# ls shorteners
alias ls='ls --color -h --group-directories-first --quoting-style=literal'
alias l='ls'
alias la='ls -A'
alias ll='ls -lh'
alias sl='ls'

# easy navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../..'

# shorteners
alias v='vim'
alias vim="nvim -i ~/.cache/nviminfo"
alias vimdiff="vim -d"

# git
# alias git='hub'
alias gitl='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias gitpp='git pull && git push'

# misc
alias rm='rm -f'
alias less='less -F -g -i -M -R -S -w -X -z -4'

alias packer='packer --noconfirm --noedit --auronly'
alias search='\packer -Ss'
alias update='sudo pacman -Syu --noconfirm; packer -Syu'

alias scrot="scrot '%Y-%m-%d_\$p_\$wx\$h.png'"

function gs {
    if [[ $# > 0 ]]; then
        git "$@"
    else
        echo "Last commit: $(time_since_last_commit) ago"
        git status --short --branch
    fi
}

function time_since_last_commit() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  git log -1 --pretty=format:"%ar" | sed 's/\([0-9]*\) \(.\).*/\1\2/'
}

function prompt_command() {
	PS1=" ${normal}\W$(rt=$?; [[ $rt = 0 ]] && echo ${black} || echo ${red}) »${normal} "
}

PROMPT_COMMAND=prompt_command;
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
	gpg-connect-agent /bye >/dev/null 2>&1
	gpg-connect-agent updatestartuptty /bye >/dev/null
fi

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi
# add alias for ssh to update the tty
alias ssh="gpg-connect-agent updatestartuptty /bye >/dev/null; ssh"
