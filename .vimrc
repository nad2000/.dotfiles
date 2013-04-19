" vim: foldmethod=marker

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

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim  http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
"color wombat256mod
color zenburn
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

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
"" set runtimepath+=$HOME/.vim/bundle/vim-pathogen/
"" runtime autoload/pathogen.vim
"" call pathogen#incubate()
"" call pathogen#helptags()

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []
if has("win32")
	call add(g:pathogen_disabled, 'powerline')
else
	call add(g:pathogen_disabled, 'vim-powerline')
endif
call pathogen#infect()

" Tab settings:
autocmd Filetype python ts=4 sts=4 sw=4 shiftround expandtab
autocmd Filetype go set ts=4 sts=4 sw=4 shiftround noexpandtab


" ============================================================================
" Python IDE Setup
" =========================================================================== {{{
" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set rtp+=$HOME/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
     if pumvisible()
         if a:action == 'j'
             return "\<C-N>"
         elseif a:action == 'k'
             return "\<C-P>"
         endif
     endif
     return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set foldenable
" }}}

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
