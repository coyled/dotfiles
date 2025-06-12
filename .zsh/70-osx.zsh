if [[ $(uname -s) == 'Darwin' ]]; then

    # don't swallow ctrl-o so i can use it in mutt...
    stty discard undef

    #
    # M1 stuff...
    #
    if [[ $(uname -p) == 'arm' ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"

        #
        # need to install
        # [CLI](https://cloud.google.com/sdk/docs/install) tarball at
        # ~/.google-cloud-sdk first.  don't use the homebrew cask...
        #
        if [[ -d ~/.google-cloud-sdk ]]; then
            source ~/.google-cloud-sdk/path.zsh.inc
            source ~/.google-cloud-sdk/completion.zsh.inc
        fi
    fi

    alias battery="pmset -g batt"

    # screen from homebrew is newer and has all the colors...
    if [[ -f /opt/homebrew/bin/screen ]]; then
      alias screen=/opt/homebrew/bin/screen
    fi

    # needed for prompts later...
    export HOSTNAME=$(scutil --get ComputerName)

fi
