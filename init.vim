execute 'source' fnamemodify(expand('<sfile>'), ':h').'/nvim/plugins.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/nvim/mappings.vim'
"24 bit color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
" performance
set cursorline
set lazyredraw
set synmaxcol=512
syntax sync minlines=512
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
set encoding=utf-8     " Utf-8
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


let g:airline_theme='oceanicnext'
colorscheme OceanicNext
let g:deoplete#enable_at_startup = 1

" Use deoplete.
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ ]

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType javascript,javscript.jsx set formatprg=prettier\ --single-quote\ --stdin
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO if &ft == ""|set ft=text|endif
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
  autocmd FileType javascript,javascript.jsx set formatprg=prettier\ --stdin
augroup end

if dein#tap('tern_for_vim')
  let g:tern#command = ['tern']
  let g:tern#arguments = ["--persistent"]
endif

if dein#tap('vim-flow')
  let g:flow#autoclose = 1
endif

let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'php': ['phpmd']
      \}

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
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1
let g:airline_powerline_fonts = 1

