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

PROMPT_HOSTNAME=$HOSTNAME

#
# if we're in a Podman container add its name to the prompt...
#
if [[ -e /run/.containerenv ]]; then
    if [[ -e /run/host/container-name ]]; then
      #
      # possible Quadlet-created container name injection if the
      # container is unprivileged...
      #
      CONTAINER_NAME=$(cat /run/host/container-name)
    else
      #
      # only available in privileged containers...
      #
      CONTAINER_NAME=$(cat /run/.containerenv | awk -F '=' '/name=/ {print $2}')]
    fi

    PROMPT_HOSTNAME="${PROMPT_HOSTNAME}[$CONTAINER_NAME]"
fi

PROMPT=' %n@${PROMPT_HOSTNAME}: %~ $(git_super_status) $fg[magenta]--->%{$reset_color%}
%(1j. [%j].) %# '

# vi mode
bindkey -v
