alias history="history -t '%Y-%m-%dT%H:%M:%S %Z'"
alias screen="export TERM=screen; screen"
alias sl="readlink -e"
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias vi="vim"
alias whois="whois -H"

if [ `uname -s` != 'Darwin' ]; then
    alias ls="ls --color"
fi
