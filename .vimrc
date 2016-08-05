" with MS: create a hard link as the admin, eg, mklink /J ".vim"  "C:\Users\nad2000\dotfiles\.vim"
" and create $HOME/.vimrc with "source $HOME/dotfiles/.vimrc"
" vim: foldmethod=marker

" https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'davidhalter/jedi-vim'
"Plug 'msanders/snipmate.vim'
"Plug 'mkitt/tabline.vim'
Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-markdown'
"Plug 'nelstrom/vim-markdown-folding'
Plug 'bling/vim-airline'
"Plug 'L9'
"Plug 'git://git.wincent.com/command-t.git'
Plug 'jnurmine/Zenburn'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
" vimcmdline: Send lines to interpreter
Plug 'jalvesaq/vimcmdline'

" TMUX:
"Plug 'benmills/vimux'
"Plug 'julienr/vimux-pyutils'
"Plug 'julienr/vim-cellmode'
"""Plug 'christoomey/vim-tmux-runner'

call plug#end()            " required
filetype plugin indent on  " required
filetype plugin on

" Turn on powerline fonts:
"let g:airline_powerline_fonts = 1
set laststatus=2 " show status line even if there is only a single window

""" Disable arrow keys
" nomap <Up> <NOP>
" nomap <Down> <NOP>
" nomap <Left> <NOP>
" nomap <Right> <NOP>
" inomap <Up> <NOP>
" inomap <Down> <NOP>
" inomap <Left> <NOP>
" inomap <Right> <NOP>

" Style:
" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim  http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
if has("win32")||has("win32unix")
    "color wombat256mod
    source $HOME/.vim/plugged/Zenburn/colors/zenburn.vim
else
    colorscheme zenburn
endif
set nosmd " short for 'showmode'
syntax enable
set number
set cursorline
set showmatch   " show mattching part of the pair for [] {} and ()

if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
let &cpo=s:cpo_save

unlet s:cpo_save

" Rebind <Leader> key {{{
let mapleader=","
set backspace=2
set clipboard=unnamed
set history=50

"set nomodeline
" }}}

"Switch between buffers without saving
set hidden

"Show command in bottom right portion of the screen
set showcmd

"Always show tabline with
set showtabline=2

"Ever notice a slight lag after typing the leader key + command? This lowers
""the timeout.
set timeoutlen=500

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
if has("win32")
    set listchars=tab:»\ ,eol:¬
else
    set showbreak=↪
    set fillchars=diff:⣿,vert:│
    set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
endif
"Invisible character colors
"" highlight NonText guifg=#4a4a59
"" highlight SpecialKey guifg=#4a4a59


" set mouse=a
set pastetoggle=<F2>
set printoptions=paper:a4
set ruler
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" golang-vim:
set rtp+=$GOROOT/misc/vim

" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" Show whitespaces (trailing)
" MUST be inserted BEFORE the colorschema command
"" autocmd ColorSchema * highlight ExtraWhitespace ctermbg=red guidb=red
"" autocmd InsertLeave * match ExtraWitespace /\s\+$/

" Remove trailing whitespeces before saving
""autocmd BufWritePre *.py :%s/\s\+$//e
""autocmd FileType go,python,c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd BufWritePre * :%s/\s\+$//e

filetype on
filetype plugin indent on
syntax on

" Show line numbers and length
set number " show line numbers
"set relativenumber " this is mad!
set tw=79  " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t  " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" easeier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" Search - case insensitive:
set hlsearch
set incsearch
set ignorecase
set smartcase

" set nobackup
" set nowritebackup
set noswapfile

" Write the old file out when switching between files.
set autowrite

set nocompatible              " be iMproved, required
filetype off                  " required

" Tab settings:
" tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd Filetype python set ts=8 sts=4 sw=4 shiftround expandtab
autocmd Filetype go set ts=4 sts=4 sw=4 shiftround noexpandtab
autocmd Filetype sh set ts=8 sts=2 sw=2 shiftround expandtab nowrap

set encoding=utf8

" NERDtree settings {{{
" Open NERDTree automatically when vim starts up if no files were specified:
autocmd vimenter * if !argc() | NERDTree | endif
" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>
"Show hidden files in NerdTree
let NERDTreeShowHidden=1
" }}}


" Folding ----------------------------------------------------------------- {{{
" from: https://github.com/sjl/dotfiles/blob/master/vim/vimrc#L541
"
set foldcolumn=3	" increases gutter width for folding indicator
set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
nnoremap <c-z> mzzMzvzz15<c-e>`z:Pulse<cr>

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
" Tabline settings {{{
if exists("+showtabline")
	map ,1 1gt
	map ,2 2gt
	map ,3 3gt
	map ,4 4gt
	map ,5 5gt
	map ,6 6gt
	map ,7 7gt
	map ,8 8gt
	map ,9 9gt
endif
" }}}

" turn on "vim: ...."
set modeline
set modelines=5

