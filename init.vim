" Set Encoding to utf-8
set encoding=utf-8
scriptencoding utf-8
" import plugins, mappings, autocommands
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/nvim/plugins.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/nvim/mappings.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/nvim/autocommands.vim'
"24 bit color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
if exists('$TMUX')
  " Colors in tmux
  let &t_8f = '<Esc>[38;2;%lu;%lu;%lum'
  let &t_8b = '<Esc>[48;2;%lu;%lu;%lum'
endif
" performance
set cursorline
set lazyredraw
set synmaxcol=512
syntax sync minlines=512
" editting
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
set list               " Show tabs and eol
set listchars=tab:▸\ ,eol:¬,extends:…,precedes:…
set display+=lastline
set scrolloff=5
set sidescrolloff=5
" ruler
set relativenumber     " relative number
set number             " hibrid number"
set cursorline         " CursorLine
set hidden             " Lets you send buffers to backgrund whitout saving them
set noerrorbells       " No beeps on error
set title              " Set the title in GUI/screen mode
set showmode           " Shows current mode under the status bar
set autowrite          " Autowrite on some commands (make)
set timeoutlen=1200    " A little bit more time for macros
set ttimeout
set ttimeoutlen=50     " Make Esc work faster
set showcmd            " Show commands as you type them
set complete-=i        " Smart complete
set laststatus=2       " Always show  status lines
set fileformats=unix,dos,mac    " Fileformat according to file
set backup             " Backup files
set backupskip+=*.tmp,crontab.* " Don't backup those files
call mkdir(expand('~/.local/share/nvim/backup'),'p')
set backupdir=~/.local/share/nvim/backup
call mkdir(expand('~/.local/share/nvim/undo'),'p')
set undodir=~/.local/share/nvim/undo
set wildmode=longest:full,full  " All options to command line completion
set wildignore+=*~,*.aux,tags,*/.git/*,*/.hg/*,*/.svn/* " ignore those files
" set incremental preview
set inccommand=split
" Section: Commands {{{1 ----------------------
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


let g:airline_theme='oceanicnext'
colorscheme OceanicNext
let g:deoplete#enable_at_startup = 1

if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

command! -bang -nargs=* Find
  \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
