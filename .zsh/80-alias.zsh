alias curl-timing='curl -w \
"{
    \"local_ip\": \"%{local_ip}\",
    \"remote_ip\": \"%{remote_ip}\",
    \"effective_url\": \"%{url_effective}\",
    \"http_code\": \"%{http_code}\",
    \"size_download\": \"%{size_download}\",
    \"size_request\": \"%{size_request}\",
    \"times\": {
        \"redirect\": \"%{time_redirect}\",
        \"namelookup\": \"%{time_namelookup}\",
        \"connect\": \"%{time_connect}\",
        \"appconnect\": \"%{time_appconnect}\",
        \"pretransfer\": \"%{time_pretransfer}\",
        \"starttransfer\": \"%{time_starttransfer}\",
        \"total\": \"%{time_total}\"
    }
}\n" \
    -o /dev/null -s'
alias history="history -t '%Y-%m-%dT%H:%M:%S %Z'"
alias lc="awk '{print tolower($1)}'"
alias uc="awk '{print toupper($1)}'"
alias pwgen='apg -a 1 -m 32 -x 32 -M SNCL -n 1 -c /dev/random'
alias sl="readlink -e"
alias urlencode='ruby -e "require \"erb\"; puts ERB::Util.url_encode(ARGV[0])"'
alias vi="vim"

if [ `uname -s` != 'Darwin' ]; then
    alias ls="ls --color"

    # ls files that are open but have been deleted...
    alias lsof-unlinked="lsof -nP +L1"

    alias whois="whois -H"
fi

alias restart-gpg-agent="gpg-connect-agent reloadagent /bye"
alias kubeshell="kubectl run edge --tty -i --restart=Never --image=alpine:edge sh"

# since `which` isn't in Debian anymore...
alias which="command -v"

#
# if we're in a container...
#
if [ -e /run/.containerenv ]; then
    alias tmux="tmux -L $(cat /run/.containerenv | awk -F '\"' '/name=/ {print $2}')"
fi
