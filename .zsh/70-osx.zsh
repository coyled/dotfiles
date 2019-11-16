if [[ $(uname -s) == 'Darwin' ]]; then

    # load homebrew tab completions...
    fpath=(/usr/local/share/zsh-completions $fpath)

    # don't swallow ctrl-o so i can use it in mutt...
    stty discard undef

    #
    # need to `brew cask install google-cloud-sdk` first...
    #
    if [[ -d /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk ]]; then
        source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
        source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
    fi

    # for brew-provided python2.7...
    export PATH="/usr/local/opt/python/libexec/bin:${PATH}"

    alias battery="pmset -g batt"

    # yubikey-stored keys for ssh...
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

    # start gpg-agent if necessary...
    gpg-connect-agent /bye

fi
