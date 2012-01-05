#
# Colors within the terminal
#

export CLICOLOR=1
export TERM=xterm-color
export LSCOLORS=fxfxcxdxbxegedabagacad

export HISTCONTROL=ignoredups:erasedups
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

#
#
#
alias ll='ls -l'
alias work="cd ~/glacier/git"
alias dir='ls -l'

#
# Hub
# requires: hub
# install brew install hub
#
alias hb="hub browse"

# 
# Application Launching
#
alias chrome="open -a /Applications/Google\ Chrome.app --args --disable-enforced-throttling"
alias psd="open -a /Applications/Adobe\ Photoshop\ CS5.1/Adobe\ Photoshop\ CS5.1.app/ $@"

# Git
alias gitsuball="git submodule foreach --recursive git submodule sync && git submodule update --init --recursive"

function __current_branch_action {
  echo  "git $1`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`"
  eval  "git $1`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`"
}

function gmox {
  __current_branch_action "merge origin/"
}
function gprox {
  __current_branch_action "pull --rebase origin "
}
function grox {
  __current_branch_action "rebase origin/"
}
function gpox {
  __current_branch_action "push origin "
}

# Ruby - Rails Aliases
alias rs='ruby script/server'
alias rsc='ruby script/console'
alias rsp='ruby script/server -e production'

# Services

#
# Postgres SQL
# requirements:
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

export BUNDLER_EDITOR="vim"
export SVN_EDITOR="vim"
export GIT_EDITOR="vim"
export GEM_OPEN_EDITOR="vim"

#
# Prompt
#

function prompt {

local LIGHT_RED="\[\033[1;31m\]"
local LIGHT_GREEN="\[\033[1;32m\]"
local NO_COLOUR="\[\033[0m\]"

local TITLEBAR='\[\033]0;\u@\h\007\]'

source ~/.git-completion.bash

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto
export GIT_PS1_SHOWSTASHSTATE=true

PS1="$TITLEBAR\n\w/$LIGHT_GREEN\$(__git_ps1 ' (%s)') $LIGHT_RED\$(~/.rvm/bin/rvm-prompt i v g)\n$NO_COLOUR$ "

}

#call the prompt function to set things in motion
prompt

#
# RVM
#

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
if test -s "~/.bashrc" ; then . "~/.bashrc" ; fi
