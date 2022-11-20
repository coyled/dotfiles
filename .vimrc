set encoding=utf-8

set expandtab
set incsearch
set ruler
set shiftwidth=4
set tabstop=4
set textwidth=70
set shiftround
set hlsearch
set number
set scrolloff=4
set autoindent
set comments=s1:/*,fmb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-

set list
set listchars=tab:␉·,trail:⎵

highlight LineNr ctermfg=darkblue
" use all the colors...
set term=builtin_ansi
set t_Co=256

syntax on

"map <F5> : !ispell %<CR>: e %<CR>

"autoformat paragraphs (e.g. mutt inline quotations)
"set formatoptions+=a

map <C-t> :NERDTreeToggle<CR>

" ctrl-left in insert mode: -1 indent level...
inoremap <ESC>[1;5D <C-d>

" ctrl-right in insert mode: +1 indent level...
inoremap <ESC>[1;5C <C-t>
