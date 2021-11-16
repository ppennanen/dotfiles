#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#============
# HISTORY
#============
export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

#============
# ENV
#============

export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export EDITOR=nvim
export GOPATH=$HOME/
export GOPROXY=https://proxy.golang.org
export PATH=$PATH:$HOME/bin:/:$HOME/.cargo/bin:/usr/local/bin:/usr/local/sbin:$HOME/.npm-global/bin
export LPASS_AGENT_TIMEOUT=60
export RIPGREP_CONFIG_PATH=~/.ripgreprc
export XDG_CONFIG_HOME=$HOME/.config

#============
# ALIAS
#============

alias ls='ls --color=auto'
alias ll='ls -al'
alias vim="nvim"
alias vi="nvim"
alias lp-ssh-pubkey='lpass show --field="Public Key" --clip'
alias gitlab-mr='git push -u -o merge_request.create -o merge_request.merge_when_pipeline_succeeds -o merge_request.remove_source_branch'
alias k=kubectl
alias x=kubectx
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

#============
# COMPLETION
#============

complete -C /opt/homebrew/bin/terraform terraform

#============
# PROMPT
#============
#PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"

. "$HOME/.cargo/env"
