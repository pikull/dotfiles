set -o vi

alias ls="lsd"
alias la="lsd -lA"
alias ll="lsd -l"

alias vim="nvim"
alias tree="tree -Ca"

alias npx="npx --use-pmpm"

export EDITOR=nvim 
export GUIEDITOR=code

setopt globdots

zstyle ":completion:*" menu select
bindkey "^[[Z" reverse-menu-complete

unsetopt correct_all
unsetopt correct

autoload -Uz compinit && compinit
autoload -Uz colors && colors

export PATH="/opt/homebrew/bin:$PATH"
export PATH="~/Library/Python/3.9/bin:$PATH"

export NVM_DIR="$HOME/.config/nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

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
