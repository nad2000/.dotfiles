if is_view ~= nil and vim.v.progname ==  "view" then
  is_view = true
end

--  enter the current millennium
vim.o.compatible = false
-- vim.o.autoread = true
-- vim.o.encoding='utf-8'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.shell='/bin/zsh'
-- vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.autochdir = true
-- Switch between buffers without saving
-- vim.o.hidden = true

-- hybrid line number mode
if not is_view then
  vim.o.relativenumber = true
  vim.o.number= true
  vim.o.undofile= true
  vim.o.undodir='$HOME/.vim/undo'
  vim.o.undolevels=1000
  vim.o.undoreload=10000
end

-- Automatically save the session when leaving Vim
vim_started_in_dir = vim.fn.getcwd()
-- execute "autocmd! VimLeave * mksession!" . vim_started_in_dir . "/.session.vim"
vim.cmd("autocmd! VimLeave * mksession!" .. vim_started_in_dir .. "/.session.vim")


-- Switch between buffers with C-S-PageUp/PageDown:
vim.keymap.set({"i", "n"},  "<C-S-PageDown>", "<esc>:bn<cr>")
vim.keymap.set({"i", "n"},  "<C-S-PageUp>", "<esc>:bp<cr>")

-- Disable arrow keys
vim.keymap.set({"i", "n"},  "<up>", "<nop>")
vim.keymap.set({"i", "n"},  "<down>", "<nop>")
vim.keymap.set({"i", "n"},  "<left>", "<nop>")
vim.keymap.set({"i", "n"},  "<right>", "<nop>")

-- <ESC> from INSERT mode via 'jk':
vim.keymap.set({"i", "n", "v", "c"},  "jk", "<ESC>")
vim.keymap.set({"i", "n", "v", "c"},  "JK", "<ESC>")
vim.o.timeoutlen=400
vim.o.ttimeoutlen=80

-- stop c, s form yanking
vim.keymap.set({"n", "x"}, "c", '"_c')
vim.keymap.set({"n", "x"}, "s", '"_s')

vim.keymap.set("n", "<f10>", ":Goyo<cr>")
vim.keymap.set("i", "<f10>", "<c-o>:Goyo<cr>")
-- if ~is_view then
--   vim.keymap.set("n", "Q", "gq")
-- end

local vim = vim
local Plug = vim.fn['plug#']
vim.call('plug#begin', "~/.vim/plugged")
if not is_view then
  Plug 'tpope/vim-sensible'
  Plug 'motemen/vim-help-random'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-dispatch'
  Plug 'fntlnz/atags.vim' -- helps you creating and updating your tag files
  Plug 'AndrewRadev/splitjoin.vim'  -- gS - split; gJ - join
  Plug('junegunn/fzf', { dir = '~/.fzf', [ 'do' ] = './install --all' })
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary' -- gc - toggle, gcap - comments out paragraph
  -- Plug 'ctrlpvim/ctrlp.vim' -- active fork of 'kien/ctrlp.vim'
  -- Plug 'jalvesaq/vimcmdline'
  Plug 'majutsushi/tagbar' -- provides an easy way to browse the tags of the current file and get an overview of its structure

  -- Python
  -- Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
  -- Automatically sort python imports
  Plug 'fisadev/vim-isort'
  vim.g.vim_isort_map = ''
  Plug('psf/black', { tag = '19.10b0' })
  vim.g.black_linelength = 99

  -- Python syntax checking
  vim.g.syntastic_python_checkers = {'flake8'}
  vim.g.syntastic_always_populate_loc_list = 0
  vim.g.syntastic_auto_loc_list = 0
  vim.g.syntastic_check_on_open = 1
  vim.g.syntastic_check_on_wq = 0

  --
  -- HTML
  Plug 'alvan/vim-closetag'
  Plug 'hansemschnokeloch/vim-jinja'

  -- Git
  Plug 'airblade/vim-gitgutter'

  Plug 'nvim-lua/plenary.nvim'
  Plug 'github/copilot.vim'
  -- Plug 'CopilotC-Nvim/CopilotChat.nvim'

end

Plug 'jnurmine/Zenburn'
Plug 'christoomey/vim-tmux-navigator'
-- Plug 'alexghergh/nvim-tmux-navigation'
Plug('Valloric/YouCompleteMe', { ['do'] = './install.py --clang-completer --gocode-completer' })
Plug 'ojroques/nvim-hardline'
Plug 'junegunn/goyo.vim'
-- Plug 'nvim-lualine/lualine.nvim'
-- If you want to have icons in your statusline choose one of these
-- Plug 'nvim-tree/nvim-web-devicons'
vim.call('plug#end')

vim.g.atags_build_commands_list = {
  "[[ $PWD != $HOME ]] && cd " .. vim_started_in_dir,
  "[[ $PWD != $HOME ]] && ctags --exclude=pgdata --exclude=static --exclude='*.css' --exclude='*.pyx'  --exclude='.*' --exclude='*.sqlite*' --exclude=staticfiles --exclude='private-media' --exclude='*.sqlite*' --exclude=$HOME --exclude='*.html' --exclude='*.js' --exclude='*.pxd' --exclude='*.pxi' -R -f tags.tmp",
  "[[ $PWD != $HOME ]] && LC_ALL=C awk 'length($0) < 400' tags.tmp > tags",
  "[[ $PWD != $HOME ]] && rm tags.tmp"
}
vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml,*.js" -- for 'alvan/vim-closetag'

-- Nvim specific key mappings (for term). NB! it will conflit with FZF.
-- Enter term with 'A'
vim.cmd [[
  autocmd BufWinEnter,WinEnter term://* startinsert!
  tnoremap <silent> <c-h> <c-\><c-n>:TmuxNavigateLeft<cr>
  tnoremap <silent> <c-j> <c-\><c-n>:TmuxNavigateDown<cr>
  tnoremap <silent> <c-k> <c-\><c-n>:TmuxNavigateUp<cr>
  tnoremap <silent> <c-l> <c-\><c-n>:TmuxNavigateRight<cr>
  " tnoremap <silent> <c-\> <c-\><c-n>:TmuxNavigatePrevious<cr>
  tnoremap jk <c-\><c-n>
  tnoremap <c-s-PageDown> <c-\><c-n>:bn<cr>
  tnoremap <c-s-PageUp> <c-\><c-n>:bp<cr>
]]

-- Styling:
vim.cmd.colorscheme("zenburn")
vim.o.showcmd = false
vim.o.cursorline = true
vim.o.showmatch = true  -- show mattching part of the pair for [] {} and ()

vim.cmd [[
  hi Search cterm=NONE ctermfg=black ctermbg=blue
  hi Comment gui=italic cterm=italic
  hi SpellBad cterm=underline
]]

vim.keymap.set("n", "<S-h>", function()
    if vim.o.laststatus ==  0 or vim.o.cmdheight == 0 then
        --  vim.o.showmode = true
        vim.o.ruler = true
        vim.o.showcmd = true
        vim.o.laststatus = 2
        vim.o.cmdheight = 1
    else
        -- vim.o.showmode = false
        vim.o.ruler = false
        vim.o.showcmd = false
        vim.o.laststatus = 0
        vim.o.cmdheight = 0
    end
end)

vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = true


-- TODO: migrate to vim.api.nvim_create_autocmd
-- Tab settings:

-- autoindent - indent when moving to the next line while writing code
-- expandtab - expand tabs into spaces
-- shiftwidth=n - when using the >> or << commands, shift lines by n spaces
vim.cmd [[
function SqlFormatter()
  set noai
  " set mappings...
  " make sure 'sqlparse' is installed: pip install sqlparse
  map ,pt  :%!sqlformat --reindent --keywords upper --identifiers lower -<CR>
endfunction
function SetVimPresentationMode()
  nnoremap <buffer> <Right> :n<CR>
  nnoremap <buffer> <Left> :N<CR>
  if !exists('#goyo')
    Goyo
  endif
endfunction
augroup FileTypes
  au!
  au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja
  au BufWritePre *.py,*.c,*.php,*.html :%s/\s+$//ge
  " au BufWritePre *.py execute ':Black'
  au BufWritePost * call atags#generate()
  au BufNewFile,BufRead Jenkinsfile setf groovy
  au BufNewFile,BufRead *.slide call SetVimPresentationMode()
  au FileType html setl sw=2 sts=2 et | command HtmlBeautify :%!html-beautify --indent-size 2 --wrap-line-length 0 --unformatted pre,code,span --extra-liners pre,code,span --indent-with-tabs=false --preserve-newlines=true --max-preserve-newlines=10 --brace-style=collapse --end-with-newline --indent-inner-html=true --indent-scripts=normal --space-in-empty-paren=true --space-in-tag=true --wrap-attributes=auto --wrap-attributes-indent-size=2 --e4x=false --jslint-happy=false --keep-array-indentation=false --break-chained-methods=false --comma-first=false --operator-position=before-newline --indent-level=2 --indent-char=' ' --extra-liners=pre,code,span | command Paginate %s/\ \{10,\}\(\d\+\)\S*$/<!-- Page: \1 -->\r<a id="page-\1" title="Page \1"><\/a>\r<span role="doc-pagebreak" id="pg\1" aria-label="\1" title="Page \1" \/>\r<span xml:id="page\1" epub:type="pagebreak" aria-label="\1" title="Page \1" \/>/ | command BreakIntoParagraphs %s/^  /<\/p>\r\r<p>\r    /gc
  au FileType jinja,html setl sw=2 sts=2 et | vmap <Leader>i S<i> | vmap <Leader>b S<b> | vmap <Leader>u S<u> | nmap <Leader>i ysiw<i> | nmap <Leader>b ysiw<b> | nmap <Leader>u ysiw<u>
  au Filetype python set ts=8 sts=4 sw=4 sr et ai | iabbrev <buffer> iff if:<esc>i
  au Filetype python nnoremap <LocalLeader>i :!isort %<CR><CR>  " Import re-sorting (https://github.com/timothycrosley/isort)
  au FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>  " Code formating with YAPF (https://github.com/google/yapf)
  au FileType python vmap <c-s-y> :call yapf#YAPF()<cr>
  au FileType python imap <c-s-y> <c-o>:call yapf#YAPF()<cr>
  au FileType python nmap <c-s-b> <c-o>:keepmarks Black<cr>
  au FileType python imap <c-s-b> <c-o>:keepmarks Black<cr>
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
  au FileType sql call SqlFormatter()
  """ au Filetype cpp set sts=2 sw=2 sr et cino=:0,g0,(0,Ws,l1
  """ au Filetype cpp ClangFormatAutoEnable
  "autocmd FileType tex set autoindent
  " Set the make program (rubber)
  au FileType tex set makeprg=rubber\ --inplace\ --maxerr\ 1\ \ --pdf\ --short\ --quiet\ --force\ %
  " Mappings for compiling Latex file
  au FileType tex nmap <buffer> <C-T> :!latexmk -pdf %<CR>
  "autocmd FileType tex nmap <buffer> <C-T> :!rubber --pdf --force --short %<CR>
  au FileType tex nmap <buffer> T :!open -a Skim %<.pdf %<.pdf<CR><CR>
  " au FileType tex nmap <buffer> C :!rubber --clean<CR>
  " Skeleton files
  " au! BufNewFile * silent! 0r ~/.vim/skel/template.%
augroup END
let g:ale_fix_on_save = 1
nmap <F8> :TagbarToggle<CR>
]]

-- Leaders:
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Why YCM is so user unfiendly:
vim.g.ycm_confirm_extra_conf = 0
vim.g.ycm_collect_identifiers_from_tags_files = 1 -- Let YCM read tags from Ctags file
vim.g.ycm_use_ultisnips_completer = 1 -- Default 1, just ensure
vim.g.ycm_seed_identifiers_with_syntax = 1 -- Completion for programming language's keyword
vim.g.ycm_complete_in_comments = 1 -- Completion in comments
vim.g.ycm_complete_in_strings = 1 -- Completion in string
vim.g.ycm_global_ycm_extra_conf = "~/.vim/.ycm_c-c++_conf.py"

-- Cipboard for all operations
-- set clipboard+=unnamedplus  " better to user '*' or '+' register
vim.g.clipboard = {
  name = 'myClipboard',
  copy = {
      ['+'] = {'tmux', 'load-buffer', '-'},
      ['*'] = {'tmux', 'load-buffer', '-'},
    },
  paste = {
      ['+'] = {'tmux', 'save-buffer', '-'},
      ['*'] = {'tmux', 'save-buffer', '-'},
  },
  cache_enabled = 1,
}

-- Go to the last cursor location when a file is opened
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local last_pos_line = vim.fn.line("''")
    local total_lines = vim.fn.line("$")
    if last_pos_line > 0 and last_pos_line <= total_lines then
      vim.cmd("normal! g`\"")
    end
  end,
})

--[[
Zoom-in/out:
^w_ -- increases the hight to the max
^w| -- increases the width to the max
]]
-- noremap Zz <c-w>_ \| <c-w>\|
vim.keymap.set({"n", "o", "s", "v"}, "Zz", "<c-w>_ | <c-w>|")
-- ^w= -- makes all windows the same height & width
-- noremap Zo <c-w>=
vim.keymap.set({"n", "o", "s", "v"}, "Zo", " <c-w>=")

require('hardline').setup {}
-- require("CopilotChat").setup()
