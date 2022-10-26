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
export HISTORY_IGNORE="(ls *|cd *|rm *|pwd|reboot|exit|e *|*AWS*|*SECRET*|*PASSWORD*|*TOKEN*|*API*|*KEY*|*PASS*|*SECRETS*|*SECRET_KEY*|*SECRET_TOKEN*|*SECRET_KEY_BASE*|*SECRET_TOKEN_BASE*|GITHUB_PAT*)"


#============
# ENV
#============

export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export EDITOR=nvim
export GOPATH=$HOME/
export GOPROXY=https://proxy.golang.org
export PATH=$HOME/bin:/:$HOME/.cargo/bin:/usr/local/bin:/usr/local/sbin:$HOME/.npm-global/bin:$PATH
export LPASS_AGENT_TIMEOUT=60
export RIPGREP_CONFIG_PATH=~/.ripgreprc
export NVM_DIR="$HOME/.nvm"
export DOCKER_BUILDKIT=1
export DOCKER_DEFAULT_PLATFORM=linux/amd64
export POETRY_CONFIG_DIR=$HOME/.config/pypoetry
export POETRY_DATA_DIR=$HOME/.local/share/pypoetry
export POETRY_CACHE_DIR=$HOME/.cache/pypoetry


if [ $(arch) = "arm64" ]; then 
  export PATH="/opt/homebrew/bin:$PATH" ; 
  export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

  export LD_FALLBACK_LIBRARY_PATH="/opt/homebrew/lib:$LD_LIBRARY_PATH"; 

  export CFLAGS="-I/opt/homebrew/include $CFLAGS"; 
  export CFLAGS="-I/opt/homebrew/opt/zlib/include $CFLAGS"; 
 
  export C_INCLUDE_PATH="$C_INCLUDE_PATH:/opt/homebrew/Cellar/librdkafka/1.9.2/include"; 

  export CPPFLAGS="-I/opt/homebrew/include $CPPFLAGS"; 
  export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/libpq/include"; 
  export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/openssl@3/include"; 
  export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/openssl/include"; 
  export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/zlib/include"; 

  export DYLD_FALLBACK_LIBRARY_PATH="/opt/homebrew/lib:$DYLD_FALLBACK_LIBRARY_PATH"
  export LDFLAGS="-L/opt/homebrew/lib $LDFLAGS"; 
  export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib/ $LDFLAGS"; 
  export LDFLAGS="-L/opt/homebrew/opt/openssl/lib/ $LDFLAGS"; 
  export LDFLAGS="-L/opt/homebrew/opt/zlib/lib $LDFLAGS"; 

  export LIBRARY_PATH="$LIBRARY_PATH:/opt/homebrew/Cellar/librdkafka/1.9.2/lib"; 

  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/opt/homebrew/opt/libpq/lib/pkgconfig"; 
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/opt/homebrew/opt/openssl@3/lib/pkgconfig"; 
fi


#============
# ALIAS
#============

alias ls='ls -G'
alias ll='ls -al'
alias vim="nvim"
alias vi="nvim"
alias k=kubectl
alias x=kubectx
alias dotfiles='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias docker=docker --platform linux/amd64
if [ $(arch) = "arm64" ]; then alias brew="/opt/homebrew/bin/brew"; fi

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

