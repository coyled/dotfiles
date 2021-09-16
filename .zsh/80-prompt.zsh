autoload -U colors
colors

#
# ubuntu >= 18.04 doen't ship with python2 but we can't assume python3
# is installed everywhere so test which exists...
#
if [[ -e $(which python3) ]]; then
    GIT_PROMPT_EXECUTABLE="python3"
    . ~/.zsh-git-prompt/zshrc.sh
elif [[ -e $(which python) ]]; then
    GIT_PROMPT_EXECUTABLE="python"
    . ~/.zsh-git-prompt/zshrc.sh
else
    echo "oops.  can't find python.  no git prompt for you."
fi

PROMPT=' %n@%m: %~ $(git_super_status) $fg[magenta]--->%{$reset_color%}
%(1j. [%j].) %# '

# vi mode
bindkey -v
