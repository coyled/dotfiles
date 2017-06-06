autoload -U colors
colors

. ~/.zsh-git-prompt/zshrc.sh

PROMPT=' %n@%m: %~ $(git_super_status) $fg[magenta]--->%{$reset_color%}
 %# '

# vi mode
bindkey -v
