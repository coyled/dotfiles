if [[ $(uname -s) == 'Darwin' ]]; then

    # don't swallow ctrl-o so i can use it in mutt...
    stty discard undef

    #
    # M1 stuff...
    #
    if [[ $(uname -p) == 'arm' ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"

        #
        # need to `brew install --cask google-cloud-sdk` first...
        #
        if [[ -d /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk ]]; then
            source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
            source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
        fi
    fi

    alias battery="pmset -g batt"

    # yubikey-stored keys for ssh...
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

    # start gpg-agent if necessary...
    gpg-connect-agent /bye

fi
