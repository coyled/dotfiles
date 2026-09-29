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

            #
            # gcloud recently started saying it prefers Python 3.12...
            #
            PYTHON_PATH="${HOMEBREW_PREFIX}/bin/python3.12"
            if [[ -f $PYTHON_PATH ]]; then
                export CLOUDSDK_PYTHON=$PYTHON_PATH
            fi
        fi
    fi

    alias battery="pmset -g batt"

    # yubikey-stored keys for ssh...
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

    # start gpg-agent if necessary...
    gpg-connect-agent /bye

    # screen from homebrew is newer and has all the colors...
    if [[ -f /opt/homebrew/bin/screen ]]; then
      alias screen=/opt/homebrew/bin/screen
    fi

    # needed for prompts later...
    export HOSTNAME=$(/usr/sbin/scutil --get ComputerName)

fi
