if [[ $(uname -s) == 'Darwin' ]]; then

    # don't swallow ctrl-o so i can use it in mutt...
    stty discard undef

    #
    # brew cask install google-cloud-sdk
    #
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

fi
