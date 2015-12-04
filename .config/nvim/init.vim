" vim: foldmethod=marker
set encoding=utf-8

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


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

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

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
au Filetype python set ts=8 sts=4 sw=4 sr et ai
au Filetype go set ts=4 sts=4 sw=4 sr noet
au FileType javascript setlocal sw=2
au Filetype sh set ts=8 sts=2 sw=2 sr et ai nowrap

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


nnoremap <leader>- ddp
nnoremap <leader>_ ddkP
inoremap <leader><c-u> <esc>viwUi 
nnoremap <leader><c-u> viwU 

iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev @@  nad2000@gmail.com
iabbrev ccopy Copyright 2015 Rad Cirskis, all rights reserved.
iabbrev ssig -- <cr>Rad Cirskis<cr>nad2000@gmail.com
