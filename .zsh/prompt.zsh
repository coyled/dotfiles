autoload -U colors
colors

PS1=" %n@%m: %~ $fg[magenta]--->%{$reset_color%}
 %# " 
export PS1
