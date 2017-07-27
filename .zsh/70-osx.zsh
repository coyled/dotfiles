if [[ $(uname -s) == 'Darwin' ]]; then

    # load homebrew tab completions...
    fpath=(/usr/local/share/zsh-completions $fpath)

    # don't swallow ctrl-o so i can use it in mutt...
    stty discard undef

    #
    # brew cask install google-cloud-sdk
    #
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

    # for brew-provided python2.7...
    export PATH="/usr/local/opt/python/libexec/bin:${PATH}"

fi
