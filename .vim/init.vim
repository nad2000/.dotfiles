" vim: foldmethod=marker
set encoding=utf-8
set ignorecase
set smartcase

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

filetype plugin indent on  " required
filetype plugin on

" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary' " gc - toggle, gcap - comments out paragraph
Plug 'ctrlpvim/ctrlp.vim' " active fork of 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
"Plug 'davidhalter/jedi-vim' " replaced with 'Valloric/YouCompleteMe'
"Plug 'msanders/snipmate.vim'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'mkitt/tabline.vim'
Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-markdown'
"Plug 'nelstrom/vim-markdown-folding'
Plug 'bling/vim-airline'
"""Plug 'bling/vim-bufferline' " airline has buffer list feature
"Plug 'L9'
"Plug 'git://git.wincent.com/command-t.git'
Plug 'jnurmine/Zenburn'
Plug 'benekastah/neomake'
" vimcmdline: Send lines to interpreter
Plug 'jalvesaq/vimcmdline'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vivien/vim-linux-coding-style'

"Plug 'bfredl/nvim-ipy' """ :( doesn't support 4.x
"Plug 'ivanov/vim-ipython' """ :( doesn't support 4.x

call plug#end()            " required

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Turn on powerline fonts:
"""let g:airline_powerline_fonts = 1
" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1

"Switch between buffers without saving
set hidden

""" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
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

" Folding ----------------------------------------------------------------- {{{
" from: https://bitbucket.org/sjl/dotfiles
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



" Tab settings:
" autoindent - indent when moving to the next line while writing code
" expandtab - expand tabs into spaces
" shiftwidth=n - when using the >> or << commands, shift lines by n spaces
augroup FileTypes
  au!
  au Filetype python set ts=8 sts=4 sw=4 sr et ai | iabbrev <buffer> iff if:<esc>i
  au FileType javascript setlocal sw=2 | iabbrev <buffer> iff if ()<esc>i
  au Filetype sh set ts=8 sts=2 sw=2 sr et ai nowrap
  au Filetype vim set ts=8 sts=2 sw=2 sr et ai nowrap
  au Filetype go set ts=4 sts=4 sw=4 sr noet
  au FileType go nmap <leader>r <Plug>(go-run)
  au FileType go nmap <leader>b <Plug>(go-build)
  au FileType go nmap <leader>t <Plug>(go-test)
  au FileType go nmap <leader>c <Plug>(go-coverage)
  au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
  au FileType go nmap <Leader>s <Plug>(go-implements)
  au FileType go nmap <Leader>i <Plug>(go-info)
augroup END

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
iabbrev ccopy Copyright 2016 Rad Cirskis, all rights reserved.
iabbrev ssig -- <cr>Rad Cirskis<cr>nad2000@gmail.com

" Golang support (vim-go):
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
"let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 1

