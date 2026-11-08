source ~/.mutt/muttrc.all
source ~/.mutt/alias

## for IMAP
#set imap_user="foo@example.com"
#unset imap_list_subscribed
#unset imap_check_subscribed
#set folder="imaps://imap.example.com:993"

## for local
set folder="~/mail/foo@example.com/"

set smtp_url="smtps://foo@example.com@smtp.example.com:587"

set spoolfile="+INBOX"
set postponed="+INBOX.Drafts"
set record="+INBOX.Sent\ Messages"
set trash="+INBOX.Trash"

set header_cache=~/mail/.mutt_cache/foo@example.com/headers/
set message_cachedir=~/mail/.mutt_cache/foo@example.com/bodies/

source ~/.mutt/mailboxes.foo@example.com
mailboxes ~/mail/SEARCH

my_hdr Bcc: foo@example.com

color index green       default "~t \"foo@example.com\""

# defaults
folder-hook . 'my_hdr From: Dave Coyle <foo@example.com>'
folder-hook . 'set from = "Dave Coyle <foo@example.com>"'
folder-hook . 'set signature = ~/.mutt/sig.dave'
