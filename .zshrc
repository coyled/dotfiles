zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
autoload -Uz compinit
compinit
setopt autocd
autoload -Uz zmv

# arrow key search...
bindkey "\e[A" up-line-or-search
bindkey "\e[B" down-line-or-search

# so accidentally hitting ctrl-s in screen doesn't lock things up...
#stty -ixon
setopt noflowcontrol

umask 0022

# don't exit shell on ctrl-d...
set -o ignoreeof

for FILE in $HOME/.zsh/*.zsh; do
     . $FILE
done
