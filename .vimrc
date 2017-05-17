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

highlight LineNr ctermfg=darkblue

syntax on

"map <F5> : !ispell %<CR>: e %<CR>

"autoformat paragraphs (e.g. mutt inline quotations)
"set formatoptions+=a

map <C-t> :NERDTreeToggle<CR>

" load plugins...
execute pathogen#infect()
