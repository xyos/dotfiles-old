" vim != vi
set nocompatible
" Section: Startup{{{
" -----------------
" OS Detection
silent function! OSX()
  return has('macunix')
endfunction
silent function! LINUX()
  return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
  return  (has('win16') || has('win32') || has('win64'))
endfunction
" -----------------
" --------------------
" Configures vim path to load files where the .vimrc is locate, it also checks
" if vim is running for first time and tries to set up plugins using gmarik's
" bundle plugin for vim.
" `vim_path` current .vim dir on script directory
" --------------------
if has('vim_starting')
  filetype off
  let b:vim_path = expand("<sfile>:h") . "/.vim"
  exe "set rtp+=" . b:vim_path
  exe "set rtp+=" . b:vim_path . "/bundle/Vundle.vim/"
  try
    call vundle#begin(expand(b:vim_path . "/bundle"))
  catch
    try
      exe '!git clone https://github.com/gmarik/Vundle.vim.git ' . shellescape(b:vim_path . "/bundle/Vundle.vim/")
      source <sfile>
      exe "set rtp+=" . b:vim_path . "/bundle/Vundle.vim/"
      call vundle#begin(expand(b:vim_path . "/bundle"))
      exe "PluginInstall"
    catch
      let b:has_bundle = 0
    endtry
  endtry
  exec("set undodir=" . expand("<sfile>:h" . "/.vim/undo"))
  exec("set backupdir=" . expand("<sfile>:h" . "/.vim/backup"))
  exec("set directory=" . expand("<sfile>:h" . "/.vim/tmp"))
endif
" --------------------
" }}}
" Section: Bundles {{{1
" ---------------------
Plugin 'gmarik/Vundle.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/neocomplcache'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'edsono/vim-matchit'
Plugin 'groenewege/vim-less'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'junegunn/vim-easy-align'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'lukerandall/haskellmode-vim'
Plugin 'mattn/emmet-vim'
Plugin 'msanders/snipmate.vim'
Plugin 'nginx.vim'
Plugin 'othree/javascript-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'thinca/vim-poslist'
Plugin 'thinca/vim-quickrun'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tsaleh/vim-supertab'
Plugin 'walm/jshint.vim'
call vundle#end()
filetype on
" Section: Options  {{{
" ----------------------
" Vim configurable Options
"
" tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" numbers

set relativenumber
set number

" editting
set autochdir          " Changes dir to current editing
set cindent            " ident with spaces
set smarttab           " Insert spaces when indenting with tab
set smartindent        " Smart ident depending on the language
set autoindent         " Autoindent on new line
set mousehide          " Hide Cursor while typing
" search
set hlsearch           " Highlights search
set incsearch          " Shows search matches as you type
set showmatch          " Shows matching Bracket, parenthesis, etc...
set smartcase          " Matchs uppercase on search
set matchtime=5        " Time to show matching Bracket
" other options
set ttimeout
set ttimeoutlen=50
set complete-=i        " no autocomplete for includes (faster vim)
set display+=lastline
if !&scrolloff
  set scrolloff=5
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif
set nrformats-=octal   " no octal on numbers starting with 0
set undolevels=1000
set updatecount=100
set backup
filetype plugin indent on
set clipboard=unnamed  " Yanking to system clipboard
set ttyfast            " Faster drawing
set cursorline         " CursorLine
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set hidden             " Lets you send buffers to backgrund whitout saving them
set history=1000       " Size of history file
set undolevels=1000    " Size of undo history file
set noerrorbells       " No beeps on error
set title              " Set the title in GUI/screen mode
set encoding=utf-8     " Utf-8
set showmode           " Shows current mode under the status bar
set colorcolumn=80     " Show a column marker for standard 80 chars on coding
set mouse=a            " Enables mouse on all modes
syntax enable          " Syntax highlighting
set synmaxcol=400      " Disables highlighting on long lines for speed
set ttyscroll=3        " Faster redrawing
set autowrite          " Autowrite on some commands (make)
set backspace=2        " Makes backspace powerful
set splitbelow         " Split windows at bottom
set suffixes+=.dvi     " Lower priority in wildcards
set timeoutlen=1200    " A little bit more time for macros
set ttimeoutlen=50     " Make Esc work faster
set mousemodel=popup   " Right click popups a menu
set scrolloff=1        " Minimum number of lines to show up/dow of current line
set showcmd            " Show commands as you type them
set complete-=i        " Smart complete
set laststatus=2       " Always show  status lines
set lazyredraw         " no redraw on macros execution
set grepprg=ack        " Ack is more powerful
set visualbell         " Screen titles on error
set wildmenu           " enhanced completion on command line
set winaltkeys=no      " Disables alt for showing the app menu
set virtualedit=block  " Lets you select on visual mode past the line
set fileformats=unix,dos,mac    " Fileformat according to file
set backupskip+=*.tmp,crontab.* " Don't backup those files
set wildmode=longest:full,full  " All options to command line completion
set wildignore+=*~,*.aux,tags,*/.git/*,*/.hg/*,*/.svn/* " ignore those files

if exists("&breakindent")
  set breakindent showbreak=+++
elseif has("gui_running")
  set showbreak=\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ +++
endif
if has("eval")
  let &fileencodings = substitute(&fileencodings,"latin1","cp1252","")
  let &highlight = substitute(&highlight,'NonText','SpecialKey','g')
endif
if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8' ) && version >= 700
  let &listchars = "tab:\u21e5\u00b7,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
else
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<
endif
if exists("+spelllang")
  set spelllang=en_us
endif
if exists('+undofile')
  set undofile
endif
if v:version >= 700
  set viminfo=!,'20,<50,s10,h
endif
if v:version >= 600
  set autoread
  set foldmethod=marker
  set printoptions=paper:letter
  set sidescrolloff=5
  set mouse=nvi
endif

if !has("gui_running") && $DISPLAY == '' || !has("gui")
  set mouse=
endif

if $TERM =~ '^screen'
  if exists("+ttymouse") && &ttymouse == ''
    set ttymouse=xterm
  endif
  if $TERM == 'screen-bce' && &t_Co == 8
    set t_Co=256
  endif
  if $TERM == 'screen-256color' || $TERM == 'xterm'
    set t_Co=256
    set background=dark
    " solarized options
    let g:solarized_termcolors = 256
    let g:solarized_visibility = "normal"
    let g:solarized_contrast = "normal"
    colorscheme solarized
  endif
  if $TERM != 'screen.linux' && &t_Co == 8
    set t_Co=256
  endif
endif

if $TERM == 'xterm-color' && &t_Co == 8
  set t_Co=16
endif

if has("dos16") || has("dos32") || has("win32") || has("win64")
  if $PATH =~? 'cygwin' && ! exists("g:no_cygwin_shell")
    set shell=bash
    set shellpipe=2>&1\|tee
    set shellslash
  endif
elseif has("mac")
  set backupskip+=/private/tmp/*
endif

" Section: Commands {{{1
" -----------------------
" Commands for vim command Line
"

" `:SudoW`      prompts sudo to write a file  if vim is not executed as sudo
command! -bar -nargs=0 SudoW :setl nomod|silent exe 'write !sudo tee % >/dev/null'|let &mod = v:shell_error
" `:W`          fixes W typo
command! -bar -nargs=* -bang W :write<bang> <args>
" `:Rename xxx` renames current file to xxx
command! -bar -nargs=* -bang -complete=file Rename :
      \ let v:errmsg = ""|
      \ saveas<bang> <args>|
      \ if v:errmsg == ""|
      \ call delete(expand("#"))|
      \ endif
" `:Invert`     toggles the background dark/light
command! -bar Invert :let &background = (&background=="light"?"dark":"light")


" Section: Mappings {{{1
" ----------------------
" plugins
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
" ------
" Leader
let mapleader = ","
let maplocalleader = ","
" ------
nnoremap Y y$
" Remove highligh search
if exists(":hohls")
  nmap <silent> <leader>/ :nohls<CR>
endif
" ------
inoremap <C-C> <Esc>`^
" jj to esc and smarter k and j
nnoremap j gj
nnoremap k gk
inoremap jj <ESC>
" ------
" indents on paste
nnoremap =p m`=ap``
nnoremap == ==
vnoremap <M-<> <gv
vnoremap <M->> >gv
vnoremap <Space> I<Space><Esc>gv
" inserts comment at the current line with vim settings
" ex:
" " -*- vim -*- vim:set ft=vim et sw=2 sts=2:
inoremap <C-X>^ <C-R>=substitute(&commentstring,' \=%s\>'," -*- ".&ft." -*- vim:set ft=".&ft." ".(&et?"et":"noet")." sw=".&sw." sts=".&sts.':','')<CR>

" Common motions on insert and command mode
inoremap <M-o> <C-O>o
inoremap <M-O> <C-O>O
inoremap <M-I> <C-O>^
inoremap <M-A> <C-O>$
inoremap <CR>  <C-G>u<CR>
" -----------------------------------------
"unmapping annoying keys
noremap! <C-J> <Down>
noremap! <C-K><C-K> <Up>
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
"-----------------------
map <F1> <Esc>
map! <F1> <Esc>
map <F3> :cnext<CR>
map <F4> :cc<CR>
map <F5> :cprev<CR>
map <C-F4> :bdelete<CR>
map <Leader>l <Plug>CapsLockToggle
inoremap <silent> <C-G><C-T> <C-R>=repeat(complete(col('.'),map(["%Y-%m-%d %H:%M:%S","%a, %d %b %Y %H:%M:%S %z","%Y %b %d","%d-%b-%y","%a %b %d %T %Z %Y"],'strftime(v:val)')+[localtime()]),0)<CR>
" Merge consecutive empty lines and clean up trailing whitespace
map <Leader>fm :g/^\s*$/,/\S/-j<Bar>%s/\s\+$//<CR>
" --------------------------------------------------------------
" windows motions
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-+> <C-w>+
map <C--> <C-w>-
" ---------------
nnoremap <Leader>c mz"dyy"dp`z
vnoremap <Leader>c "dymz"dP`z
nnoremap ; :
nnoremap ,; ;
"PHP mappings
autocmd FileType php noremap L f$l
autocmd FileType php noremap H F$l

" Section: Autocommands {{{1
" --------------------------

if has("autocmd")
  augroup FTCheck " {{{2
    autocmd!
    autocmd BufNewFile,BufRead */apache2/[ms]*-*/* set ft=apache
    autocmd BufNewFile,BufRead *named.conf* set ft=named
    autocmd BufNewFile,BufRead *.cl[so],*.bbl set ft=tex
    autocmd BufNewFile,BufRead /var/www/*.module set ft=php
    autocmd BufNewFile,BufRead *.vb set ft=vbnet
    autocmd BufNewFile,BufRead *.CBL,*.COB,*.LIB set ft=cobol
    autocmd BufNewFile,BufRead /var/www/*
          \ let b:url=expand("<afile>:s?^/var/www/?http://localhost/?")
    autocmd BufNewFile,BufRead /etc/udev/*.rules set ft=udev
    autocmd BufRead * if ! did_filetype() && getline(1)." ".getline(2).
          \ " ".getline(3) =~? '<\%(!DOCTYPE \)\=html\>' | setf html | endif
    autocmd BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO if &ft == ""|set ft=text|endif
  augroup END " }}}2
  augroup FTOptions " {{{2
    autocmd!
    autocmd FileType c,cpp,cs,java setlocal ai et sta sw=4 sts=4 cin
    autocmd FileType sh,csh,tcsh,zsh setlocal ai et sta sw=4 sts=4
    autocmd FileType tcl,perl,python setlocal ai et sta sw=4 sts=4
    autocmd FileType markdown,liquid setlocal ai et sta sw=2 sts=2 tw=72
    autocmd FileType javascript setlocal ai et sta sw=2 sts=2 ts=2 cin isk+=$
    autocmd FileType php,aspperl,aspvbs,vb setlocal ai et sta sw=4 sts=4
    autocmd FileType apache,sql,vbnet setlocal ai et sta sw=4 sts=4
    autocmd FileType tex,css,scss setlocal ai et sta sw=2 sts=2
    autocmd FileType html,xhtml,wml,cf setlocal ai et sta sw=2 sts=2
    autocmd FileType xml,xsd,xslt setlocal ai et sta sw=2 sts=2 ts=2
    autocmd FileType eruby,yaml,ruby setlocal ai et sta sw=2 sts=2
    autocmd FileType cucumber setlocal ai et sta sw=2 sts=2 ts=2
    autocmd FileType text,txt,mail setlocal ai com=fb:*,fb:-,n:>
    autocmd FileType c,cpp,cs,java,perl,javscript,php,aspperl,tex,css let b:surround_101 = "\r\n}"
    autocmd FileType apache setlocal commentstring=#\ %s
    autocmd FileType aspvbs,vbnet setlocal comments=sr:'\ -,mb:'\ \ ,el:'\ \ ,:',b:rem formatoptions=crq
    autocmd FileType asp* runtime! indent/html.vim
    autocmd FileType bst setlocal ai sta sw=2 sts=2
    autocmd FileType cobol setlocal ai et sta sw=4 sts=4 tw=72 makeprg=cobc\ -x\ -Wall\ %
    autocmd FileType cs silent! compiler cs | setlocal makeprg=gmcs\ %
    autocmd FileType css silent! setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType git,gitcommit setlocal foldmethod=syntax foldlevel=1
    autocmd FileType gitcommit setlocal spell
    autocmd FileType help setlocal ai fo+=2n | silent! setlocal nospell
    autocmd FileType html setlocal iskeyword+=~
    autocmd FileType java silent! compiler javac | setlocal makeprg=javac\ %
    autocmd FileType perl silent! compiler perl
    autocmd FileType pdf setlocal foldmethod=syntax foldlevel=1
    autocmd FileType text,txt setlocal tw=78 linebreak nolist
    autocmd FileType tex silent! compiler tex | setlocal makeprg=latex\ -interaction=nonstopmode\ % formatoptions+=l
    autocmd FileType vim setlocal ai et sta sw=2 sts=2 keywordprg=:help
    autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
    autocmd FileType * if exists("+completefunc") && &completefunc == "" | setlocal completefunc=syntaxcomplete#Complete | endif
  augroup END "}}}2
endif " has("autocmd")

" Section: BundleOptions {{{1
" ---------------------
try
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_mode_map = {
        \ '__' : '-',
        \ 'n'  : 'N',
        \ 'i'  : 'I',
        \ 'R'  : 'R',
        \ 'c'  : 'C',
        \ 'v'  : 'V',
        \ 'V'  : 'V',
        \ '' : 'V',
        \ 's'  : 'S',
        \ 'S'  : 'S',
        \ '' : 'S',
        \ }
catch
endtry
" Section: Visual {{{1
" --------------------
if WINDOWS()
  colorscheme xoria256
  if has('gui')
    set guioptions-=e
    set guioptions-=m
    set guioptions-=g
    set guioptions-=r
    set guioptions-=L
    set guioptions-=t
    set guioptions-=T
    set guifont=Consolas_for_Powerline_FixedD:h9:cANSI
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline_left_sep = '⮀'
    let g:airline_left_alt_sep = '⮁'
    let g:airline_right_sep = '⮂'
    let g:airline_right_alt_sep = '⮃'
    let g:airline_symbols = {}
    let g:airline_symbols.space = "\ua0"
    let g:airline_symbols.branch = '⭠'
    let g:airline_symbols.readonly = '⭤'
    let g:airline_symbols.linenr = '⭡'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.whitespace = '·'
    colorscheme solarized
    let listchars = "tab:\u21e5\u00b7,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
    let g:airline_theme='solarized'
  endif
endif
if has('unix')
  set shell=/bin/bash
endif
" }}}
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
" -*- vim -*- vim:set ft=vim et sw=2 sts=2 tw=78:
