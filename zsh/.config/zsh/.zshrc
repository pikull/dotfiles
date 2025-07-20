set -o vi

alias ls='lsd'
alias la='lsd -lA'
alias ll='lsd -l'

alias vim='nvim'
alias tree='tree -C'

export EDITOR=nvim 
export GUIEDITOR=code

zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete

unsetopt correct_all
unsetopt correct

autoload -Uz compinit && compinit
autoload -Uz colors && colors

export PATH="/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin"
export PATH="/opt/homebrew/bin:$PATH"

# to update all extensions, run:
# rm -rf $ZDOTDIR/plugins && exec zsh

if [[ ! -e $ZDOTDIR/plugins/zsh-syntax-highlighting ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZDOTDIR/plugins/zsh-syntax-highlighting
fi

if [[ ! -e $ZDOTDIR/plugins/zsh-autosuggestions ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZDOTDIR/plugins/zsh-autosuggestions
fi

source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# end plugins
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/akshunc/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
