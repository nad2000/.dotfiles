" vim: foldmethod=marker

" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'pangloss/vim-javascript'
Plug 'bling/vim-bufferline' " airline has buffer list feature
"Plug 'davidhalter/jedi-vim' " replaced with 'Valloric/YouCompleteMe'
"Plug 'msanders/snipmate.vim'
"Plug 'mkitt/tabline.vim'
Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-markdown'
"Plug 'nelstrom/vim-markdown-folding'
Plug 'bling/vim-airline'
"Plug 'L9'
"Plug 'git://git.wincent.com/command-t.git'
Plug 'jnurmine/Zenburn'
Plug 'benekastah/neomake'
" vimcmdline: Send lines to interpreter
Plug 'jalvesaq/vimcmdline'

"Plug 'bfredl/nvim-ipy' """ :( doesn't support 4.x
"Plug 'ivanov/vim-ipython' """ :( doesn't support 4.x

call plug#end()            " required
filetype plugin indent on  " required
filetype plugin on

" Turn on powerline fonts:
let g:airline_powerline_fonts = 1
" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1

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
colorscheme zenburn
set nosmd " short for 'showmode'
syntax enable
set number
set cursorline
set showmatch   " show mattching part of the pair for [] {} and ()

" NERDtree settings {{{
" Open NERDTree automatically when vim starts up if no files were specified:
autocmd vimenter * if !argc() | NERDTree | endif
" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>
"Show hidden files in NerdTree
let NERDTreeShowHidden=1
" }}}

" Tab settings:
" autoindent - indent when moving to the next line while writing code
" expandtab - expand tabs into spaces
" shiftwidth=n - when using the >> or << commands, shift lines by n spaces
autocmd Filetype python set ts=8 sts=4 sw=4 sr et ai
autocmd Filetype go set ts=4 sts=4 sw=4 sr noet
autocmd FileType javascript setlocal sw=2

" Leaders:
let mapleader = ","
let maplocalleader = "\\"


" Remember the last open terminal buffer ID:
augroup Terminal
  au!
  au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
augroup END

function! REPLSend(lines)
  call jobsend(g:last_terminal_job_id, add(a:lines, ''))
endfunction

command! REPLSendLine call REPLSend([getline('.')])
command! REPLSendSelectedLines call REPLSend(getline("'<", "'>" ))

nnoremap <silent> <f6> :REPLSendLine<cr>
vnoremap <selent> <f5> :REPLSendSelectedLines<cr>

