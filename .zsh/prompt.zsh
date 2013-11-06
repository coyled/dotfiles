autoload -U colors
colors

. ~/.zsh/git-prompt.sh

PROMPT=' %n@%m: %~ $(git_super_status) $fg[magenta]--->%{$reset_color%}
 %# '
