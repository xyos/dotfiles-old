"24 bit color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
" performance
set cursorline
set lazyredraw
set synmaxcol=128
syntax sync minlines=256
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
" ruler
set relativenumber     " relative number
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set hidden             " Lets you send buffers to backgrund whitout saving them
set noerrorbells       " No beeps on error
set title              " Set the title in GUI/screen mode
set encoding=utf-8     " Utf-8
set showmode           " Shows current mode under the status bar
set autowrite          " Autowrite on some commands (make)
set timeoutlen=1200    " A little bit more time for macros
set ttimeoutlen=50     " Make Esc work faster
set scrolloff=1        " Minimum number of lines to show up/dow of current line
set showcmd            " Show commands as you type them
set complete-=i        " Smart complete
set laststatus=2       " Always show  status lines
set fileformats=unix,dos,mac    " Fileformat according to file
set backup		" Backup files
set backupskip+=*.tmp,crontab.* " Don't backup those files
set wildmode=longest:full,full  " All options to command line completion
set wildignore+=*~,*.aux,tags,*/.git/*,*/.hg/*,*/.svn/* " ignore those files
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
" Section: Mappings {{{1
" ----------------------
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




call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'dracula/vim'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'iCyMind/NeoSolarized'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': ['javascript', 'javascript.jsx'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jreybert/vimagit'
call plug#end()

let g:airline_theme='dracula'
colorscheme dracula
let g:deoplete#enable_at_startup = 1
" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
      \ 'tern#Complete',
      \ 'jspc#omni'
      \]
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1
let g:airline_powerline_fonts = 1

if exists(':tnoremap')
  tnoremap <Esc> <C-\><C-n>
endif
