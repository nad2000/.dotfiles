" vim: foldmethod=marker

" it's 'view' not 'vi/vim/...'
let is_view = (v:progname ==? 'view')

" enter the current millennium
set nocompatible
set autoread
set encoding=utf-8
set ignorecase
set smartcase
" hybrid line number mode
if !is_view
  set relativenumber
  set number
endif

" Switch between buffers without saving
set hidden

" Switch between buffers with C-S-PageUp/PageDown:
noremap <c-s-PageDown> <esc>:bn<cr>
noremap <c-s-PageUp> <esc>:bp<cr>

""" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" <ESC> from INSERT mode via 'jk':
vmap jk <ESC>
vmap JK <ESC>
imap jk <ESC>
imap JK <ESC>
cmap jk <ESC>
cmap JK <ESC>
set timeoutlen=400

" stop c, s form yanking
nnoremap c "_c
xnoremap c "_c
nnoremap s "_s
xnoremap s "_s

"
"python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF

filetype plugin on
filetype plugin indent on  " required
" https://github.com/junegunn/vim-plug
if ! filereadable(expand('~/.vim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.vim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.vim/autoload/plug.vim
endif

call plug#begin('~/.vim/plugged')
if !is_view  " Disable plugins for 'view'
" General
"Plug 'lucc/vim-tip'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'  " Syntax Checking
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }
" Install nightly build, replace ./install.sh with install.cmd on windows
" Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
"Plug 'SirVer/ultisnips'  " Track the engine.
"Plug 'honza/vim-snippets' " Snippets are separated from the engine. Add this if you want them
Plug 'tpope/vim-surround'
Plug 'fntlnz/atags.vim' " helps you creating and updating your tag files
Plug 'AndrewRadev/splitjoin.vim'  " gS - split; gJ - join
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary' " gc - toggle, gcap - comments out paragraph
" Plug 'ctrlpvim/ctrlp.vim' " active fork of 'kien/ctrlp.vim'
Plug 'jalvesaq/vimcmdline'
"Plug 'davidhalter/jedi-vim' " replaced with 'Valloric/YouCompleteMe'
"Plug 'msanders/snipmate.vim'
"Plug 'mkitt/tabline.vim'
"Plug 'tpope/vim-markdown'
"Plug 'nelstrom/vim-markdown-folding'
"Plug 'bfredl/nvim-ipy' " :( doesn't support 4.x
"Plug 'ivanov/vim-ipython' " :( doesn't support 4.x
"Plug 'bling/vim-bufferline' " airline has buffer list feature
"Plug 'git://git.wincent.com/command-t.git'
"Plug 'benekastah/neomake'

" C
Plug 'vivien/vim-linux-coding-style'

" C++/clang
Plug 'rhysd/vim-clang-format'

" C#
Plug 'OmniSharp/omnisharp-vim'

" HTML
Plug 'alvan/vim-closetag'
Plug 'lepture/vim-jinja'  " Jinja2 template support
"Plug 'vim-scripts/matchit.zip'

" JavaScript and stuff
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx' " React JSX support
Plug 'maksimr/vim-jsbeautify'
Plug 'leafgarland/typescript-vim'

" GO
let g:go_version_warning = 0
Plug 'fatih/vim-go'
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.vim/plugged/gocode/nvim/symlink.sh' }
" go get -u github.com/cweill/gotests/...
Plug 'buoto/gotests-vim'

" Git
Plug 'airblade/vim-gitgutter'

" Python
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'integralist/vim-mypy'
" Automatically sort python imports
Plug 'fisadev/vim-isort'

" Robot Framework
Plug 'Costallat/robotframework-vim'

" Rust..
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Generic
Plug 'editorconfig/editorconfig-vim'

" post install (yarn install | npm install)
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Terraform
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'

" LaTex
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
endif

" Theming and UX
Plug 'takac/vim-hardtime'  " disable arrow keys and other vim-smells
Plug 'jnurmine/Zenburn'
if !is_view
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'majutsushi/tagbar' " provides an easy way to browse the tags of the current file and get an overview of its structure
endif
Plug 'junegunn/goyo.vim'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()            " required
"let loaded_matchit = 1

" Nvim specific key mappings (for term). NB! it will conflit with FZF.
if exists(':tnoremap')
  " Enter term with 'A'
  autocmd BufWinEnter,WinEnter term://* startinsert!
  tnoremap <silent> <c-h> <c-\><c-n>:TmuxNavigateLeft<cr>
  tnoremap <silent> <c-j> <c-\><c-n>:TmuxNavigateDown<cr>
  tnoremap <silent> <c-k> <c-\><c-n>:TmuxNavigateUp<cr>
  tnoremap <silent> <c-l> <c-\><c-n>:TmuxNavigateRight<cr>
  " tnoremap <silent> <c-\> <c-\><c-n>:TmuxNavigatePrevious<cr>
  tnoremap jk <c-\><c-n> 
  tnoremap <c-s-PageDown> <c-\><c-n>:bn<cr>
  tnoremap <c-s-PageUp> <c-\><c-n>:bp<cr>
endif

let g:atags_build_commands_list = [
    \"[[ $PWD != $HOME ]] && ctags --exclude=$HOME --exclude='*.html' --exclude='*.js' --exclude='*.pxd' -R -f tags.tmp",
    \"[[ $PWD != $HOME ]] && awk 'length($0) < 400' tags.tmp > tags",
    \"[[ $PWD != $HOME ]] && rm tags.tmp"
    \]
let g:closetag_filenames = "*.html,*.xhtml,*.phtml" " for 'alvan/vim-closetag'

" Turn on powerline fonts:
"""let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='alduin'


" Style:
colorscheme zenburn
set nosmd " short for 'showmode'
syntax enable
set cursorline
set showmatch   " show mattching part of the pair for [] {} and ()
hi Search cterm=NONE ctermfg=black ctermbg=blue

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" Open NERDTree automatically when vim starts up if no files were specified:

if !is_view
  autocmd vimenter * if !argc() | NERDTree | endif
  " Give a shortcut key to NERD Tree
  map <F2> :NERDTreeToggle<CR>
  "Show hidden files in NerdTree
  let NERDTreeShowHidden=1
endif

" Folding ----------------------------------------------------------------- {{{
" from: https://bitbucket.org/sjl/dotfiles
"
if !is_view
  set foldcolumn=3	" increases gutter width for folding indicator
  set foldlevelstart=0
endif

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
"
" autoindent - indent when moving to the next line while writing code
" expandtab - expand tabs into spaces
" shiftwidth=n - when using the >> or << commands, shift lines by n spaces
augroup FileTypes
  au!
  au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja
  au BufWritePre *.py,*.c,*.php,*.html :%s/\s+$//ge
  au BufWritePost * call atags#generate()
  au BufNewFile,BufRead Jenkinsfile setf groovy
  au FileType html setl sw=2 sts=2 et
  au FileType jinja setl sw=2 sts=2 et
  au Filetype python set ts=8 sts=4 sw=4 sr et ai | iabbrev <buffer> iff if:<esc>i
  au Filetype python nnoremap <LocalLeader>i :!isort %<CR><CR>  " Import re-sorting (https://github.com/timothycrosley/isort)
  au FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>  " Code formating with YAPF (https://github.com/google/yapf)
  au FileType python vmap <c-s-y> :call yapf#YAPF()<cr>
  au FileType python imap <c-s-y> <c-o>:call yapf#YAPF()<cr>
  au FileType python let g:ale_linters = {'python': ['flake8']}
  au FileType javascript setlocal sw=2 | iabbrev <buffer> iff if ()<esc>i
  au FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
  au FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
  au FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
  au FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
  au FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
  au FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
  au FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
  au FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
  au FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
  au FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
  au Filetype sh set ts=8 sts=2 sw=2 sr et ai nowrap
  au Filetype vim set ts=8 sts=2 sw=2 sr et ai nowrap
  au Filetype go set ts=4 sts=4 sw=4 sr noet
  au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  au FileType go nmap <Leader>r <Plug>(go-run)
  au FileType go nmap <Leader>b <Plug>(go-build)
  au FileType go nmap <Leader>t <Plug>(go-test)
  au FileType go nmap <Leader>c <Plug>(go-coverage)
  au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
  au FileType go nmap <Leader>s <Plug>(go-implements)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au Filetype cpp set sts=2 sw=2 sr et cino=:0,g0,(0,Ws,l1
  au Filetype cpp ClangFormatAutoEnable
augroup END
let g:ale_fix_on_save = 1

" Jump to the last cursor position in the file:
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

nmap <F8> :TagbarToggle<CR>

" Leaders:
let mapleader = ","
let maplocalleader = "\\"

" Remember the last open terminal buffer ID:
" augroup Terminal
"   au!
"   au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
" augroup END

function! REPLSend(lines)
  call jobsend(g:last_terminal_job_id, add(a:lines, ''))
endfunction

command! REPLSendLine call REPLSend([getline('.')])
command! REPLSendSelectedLines call REPLSend(getline("'<", "'>" ))

" nnoremap <Silent> <F6> :REPLSendLine<cr>
" vnoremap <Silent> <F5> :REPLSendSelectedLines<cr>

map <f6> <esc>:setlocal spell! spelllang=en_uk<cr>
nmap <f10> :Goyo<cr>
imap <f10> <c-o>:Goyo<cr>
nnoremap Q gq

nnoremap <Leader>- ddp
nnoremap <Leader>_ ddkP
inoremap <Leader><C-U> <ESC>viwUi
nnoremap <Leader><C-U> viwU

iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev @@  nad2000@gmail.com
iabbrev ccopy Copyright 2019 Rad Cirskis, all rights reserved.
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

" Rust
let g:rustfmt_autosave = 1

" Disable mouse (for clipboard support install xsel and/or xclip)
set mouse=cn

" Why YCM is so user unfiendly:
let g:ycm_confirm_extra_conf = 0

" Cipboard for all operations
"" set clipboard+=unnamedplus  " better to user '*' or '+' register

" CTRL-S for saveing:
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
function! PLAY()
  normal /mysql
endfunction

" Search in subdirs:
set path+=**

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Snippep completion:
" let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function! ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "\<C-R>=ExpandSnippetOrCarriageReturn()\<CR>" : "\<CR>"

" LLVM C++ Style:
let g:clang_format#style_options = {
  \ "AccessModifierOffset" : -4,
  \ "AllowShortIfStatementsOnASingleLine" : "true",
  \ "AlwaysBreakTemplateDeclarations" : "true",
  \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
"autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
"autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
autocmd FileType cpp,objc nnoremap <c-f> :<C-u>ClangFormat<CR>
autocmd FileType cpp,objc vnoremap <c-f> :ClangFormat<CR>
" if you install vim-operator-user
"autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" Zoom-in/out:
" ^w_ -- increases the hight to the max
" ^w| -- increases the width to the max
noremap Zz <c-w>_ \| <c-w>\|
" ^w= -- makes all windows the same height & width
noremap Zo <c-w>=

" Automatically save the session when leaving Vim
autocmd! VimLeave * mksession! .session.vim
" " Automatically load the session when entering vim
" autocmd! VimEnter * source .session.vim
