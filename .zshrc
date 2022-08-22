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
export GPG_TTY=$(tty)
export NVM_DIR="$HOME/.nvm"


# libpq is keg-only, which means it was not symlinked into /opt/homebrew,
# because conflicts with postgres formula.
#
# Add libpq to PATH:
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# For compilers to work with some homebrew packages:
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/libpq/lib"
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/libpq/include"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/openssl@3/include"

# For pkg-config to find libpq you may need to set:
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/opt/homebrew/opt/libpq/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/opt/homebrew/opt/openssl@3/lib/pkgconfig"


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
if [ -f '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'; fi

#============
# COMPLETION
#============

autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit
mkdir -p ~/.zfunc 

# Command completion for gcloud.
if [ -f '/Users/${USER}/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/${$USER}/bin/google-cloud-sdk/completion.zsh.inc'; fi

# Command completion for aws-cli
if [ -x "$(command -v aws_completer)" ]; then complete -C 'aws_completer' aws; fi

# Command completion for poetry
if [ -x "$(command -v poetry)" ]; then poetry completions zsh > ~/.zfunc/_poetry; fi

# Command completion for kubectl
if [ -x "$(command -v kubectl)" ]; then kubectl completion zsh > ~/.zfunc/_kubectl; fi

# Command completion for terraform
if [ -x "$(command -v terraform)" ]; then complete -o nospace -C terraform terraform > ~/.zfunc/_terraform; fi

# Load nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"

# Command completion for nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

#============
# PROMPT
#============
if [ -x "$(command -v starship)" ]; then eval "$(starship init zsh)"; fi
