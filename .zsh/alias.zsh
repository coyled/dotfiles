alias history="history -t '%Y-%m-%dT%H:%M:%S %Z'"
alias pwgen='apg -a 1 -m 32 -x 32 -M SNCL -n 1 -c /dev/random'
alias screen="export TERM=screen; screen"
alias sl="readlink -e"
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias vi="vim"
alias whois="whois -H"

if [ `uname -s` != 'Darwin' ]; then
    alias ls="ls --color"

    # ls files that are open but have been deleted...
    alias lsof-unlinked="lsof -nP +L1"
fi
