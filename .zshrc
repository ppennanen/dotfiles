#============
# History
# ===========

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
#setopt BANG_HIST                 # Treat the '!' character specially during expansion.
#setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
#setopt HIST_BEEP                 # Beep when accessing nonexistent history.

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

#============
# ALIAS
#============

alias ls='ls -G'
alias ll='ls -al'
alias vim="nvim"
alias vi="nvim"
alias k=kubectl
alias x=kubectx
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias docker=docker --platform linux/amd64

#============
# PATH
#============

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ppennanen/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ppennanen/bin/google-cloud-sdk/path.zsh.inc'; fi

#============
# COMPLETION
#============

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ppennanen/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ppennanen/bin/google-cloud-sdk/completion.zsh.inc'; fi

kubectl completion zsh > "${fpath[1]}/_kubectl"

#============
# PROMPT
#============

eval "$(starship init zsh)"

