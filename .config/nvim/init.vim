" vim: foldmethod=marker

set nocompatible" be iMproved, required 
filetype off" required

" TODO: migrae to vim-plug
" Vundle: https://github.com/VundleVim/Vundle.vim 
set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin() 


Plugin 'VundleVim/Vundle.vim' 

" Git helpers
Plugin 'tpope/vim-fugitive' 
Plugin 'airblade/vim-gitgutter' 

Plugin 'kien/ctrlp.vim' 
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode' 
"Plugin 'msanders/snipmate.vim' 
"Plugin 'mkitt/tabline.vim' 
Plugin 'tpope/vim-markdown'
"Plugin 'nelstrom/vim-markdown-folding' 
Plugin 'bling/vim-airline'
"Plugin 'L9'
"Plugin 'git://git.wincent.com/command-t.git' 
Plugin 'Zenburn'
"Plugin 'scrooloose/syntastic' 
Plugin 'benekastah/neomake'

call vundle#end()" required 
filetype plugin indent on" required 
filetype plugin on 

" Turn on powerline fonts:
let g:airline_powerline_fonts = 1 

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
syntax on
