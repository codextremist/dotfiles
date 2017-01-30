syntax enable           " syntax highlighting on for programming languages
filetype plugin on
" 1. Editor

set noswapfile
set clipboard=unnamedplus "alias unnamed register to the + register, which is the X Window clipboard
set backspace=2   " backspace key acts like it does in other programs
set tabstop=2     " num of visual spaces per tab
set softtabstop=2 " the num of spaces a tab count for when editing
set shiftwidth=2  " 
set expandtab     " turn tabs into spaces

" 3. UI config

"syntax enable           " syntax highlighting on for programming languages
set t_Co=256            " set 256 colors
colorscheme badwolf     " set the colorscheme
"filetype plugin indent on
set textwidth=100       " wrap text to =[num] chars
set colorcolumn=+1      " highlights a column right after 'textwidth'
"highlight ColorColumn ctermbg=234
set number              " show line numbers
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlights matching [{()}] in programming languages
set mouse=a             " move the cursor with mouse clicks
set list                " show invisibles
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:»  " set chars to represent invisibles
"filetype plugin indent on
set autoindent    "If you're indented, new lines will also be indented
set smartindent   " new lines should be indented in programming languages

" 4. Key Mappings

" navigation keys work like standard editors
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

" toggle 'set list' -> show invisibles
nmap <leader>l :set list! <CR>

" remove trailing spaces
nnoremap <F5> :%s/\s\+$//e<CR>

" toggle emenu
map <F4> :emenu <C-Z>
source $VIMRUNTIME/menu.vim

" copy with ctrl + c
vmap <C-C> "+y

" toggle NERDtree
map <C-n> :NERDTreeToggle<CR>

" This mapping uses <cword> to get the word under the cursor, and searches for it in the current
" directory and all subdirectories, opening the quickfix window when done:
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

command! -nargs=+ Grep execute 'silent grep! -I -r -n . -e <args>' | copen | execute 'silent /<args>' | redraw!
:nmap <leader>g :Grep <c-r>=expand("<cword>")<cr><cr> 

" 5. Plugins

call plug#begin()
" indentLine
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '┊'
let g:indentLine_color_term=239

" NERDTree
Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NerdCommenter
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1     " add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " use compact syntax for prettified multi-line comments

" ctrlp.vim
Plug 'kien/ctrlp.vim'

call plug#end()
