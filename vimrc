set nocompatible " not vi compatible

"--------------
" Load pathogen
"--------------
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

"------------------
" Syntax and indent
"------------------
syntax on " turn on syntax highlighting
set showmatch " show matching braces when text indicator is over them

" vim can autodetect this based on $TERM (e.g. 'xterm-256color')
" but it can be set to force 256 colors
" set t_Co=256
set background=dark
if &t_Co < 256
    colorscheme solarized
    set nocursorline " looks bad in this mode
else
    "colors don't look right if next line uncommented
    "let g:solarized_termcolors=256 " instead of 16 color with mapping in terminal
    colorscheme solarized
    " customized colors
    highlight SignColumn ctermbg=234
    highlight StatusLine cterm=bold ctermfg=245 ctermbg=235
    highlight StatusLineNC cterm=bold ctermfg=245 ctermbg=235
    let g:NeatStatusLine_color_normal='ctermfg=64 ctermbg=235 cterm=bold'
    let g:NeatStatusLine_color_insert='ctermfg=136 ctermbg=235 cterm=bold'
    let g:NeatStatusLine_color_replace='ctermfg=160 ctermbg=235 cterm=bold'
    let g:NeatStatusLine_color_visual='ctermfg=33 ctermbg=235 cterm=bold'
    let g:NeatStatusLine_color_position='ctermfg=245 ctermbg=235 cterm=bold'
    let g:NeatStatusLine_color_modified='ctermfg=166 ctermbg=235 cterm=bold'
    let g:NeatStatusLine_color_line='ctermfg=61 ctermbg=235 cterm=bold'
    let g:NeatStatusLine_color_filetype='ctermfg=37 ctermbg=235 cterm=bold'
endif

if has('gui_running')
  set lines=65
  set columns=90
endif

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

filetype plugin indent on " enable file type detection
set autoindent

"---------------------
" Basic editing config
"---------------------
set nobackup
set showcmd
set incsearch " incremental search (as string is being typed)
set hlsearch " highlight search
set ruler " show current position in file
set scrolloff=5 " show lines above and below cursor (when possible)
set backspace=indent,eol,start " allow backspacing over everything
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set history=8192 " more history
"
" use 2 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=2

set mouse+=a " enable mouse mode (scrolling, selection, etc)
if &term =~ '^screen' || has('win32unix')
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

"--------------------
" Keyboard mappings
"--------------------

let maplocalleader = "\\"
let localleader = "\\"

nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>

"--------------------
" Misc configurations
"--------------------

autocmd BufNewFile,BufRead *.adoc,*.asciidoc setlocal filetype=adoc

"---------------------
" Plugin configuration
"---------------------

let g:clojure_fuzzy_indent = 1

"---------------------
" Local customizations
"---------------------

" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

