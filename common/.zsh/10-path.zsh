export PATH=$HOME/bin:$HOME/sbin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:~/.rbenv/bin
export PATH=$PATH:~/.go/bin

if [[ -f /etc/lsb-release ]]; then
    . /etc/lsb-release
    if [[ $DISTRIB_ID == 'Ubuntu' ]]; then
        if [[ -d /snap/bin ]]; then
            export PATH=$PATH:/snap/bin
        fi
    fi
fi
