SCRIPT  /home/xyos/code/dotfiles/init.vim
Sourced 1 time
Total time:   0.089500
 Self time:   0.008137

count  total (s)   self (s)
                            "24 bit color
    1              0.000718 let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    1              0.000024 set termguicolors
                            " performance
    1              0.000006 set cursorline
    1              0.000003 set lazyredraw
    1              0.000008 set synmaxcol=512
    1              0.000013 syntax sync minlines=512
                            " editting
    1              0.000005 set autochdir          " Changes dir to current editing
    1              0.000003 set cindent            " ident with spaces
    1              0.000003 set smarttab           " Insert spaces when indenting with tab
    1              0.000003 set smartindent        " Smart ident depending on the language
    1              0.000003 set autoindent         " Autoindent on new line
    1              0.000012 set mousehide          " Hide Cursor while typing
                            " search
    1              0.000004 set hlsearch           " Highlights search
    1              0.000003 set incsearch          " Shows search matches as you type
    1              0.000004 set showmatch          " Shows matching Bracket, parenthesis, etc...
    1              0.000003 set smartcase          " Matchs uppercase on search
    1              0.000003 set matchtime=5        " Time to show matching Bracket
                            " other options
    1              0.000003 set list               " Show tabs and eol
    1              0.000012 set listchars=tab:▸\ ,eol:¬,extends:…,precedes:…
    1              0.000048 set display+=lastline
    1              0.000003 set scrolloff=5
    1              0.000003 set sidescrolloff=5
                            " ruler
    1              0.000003 set relativenumber     " relative number
    1              0.000002 set number             " hibrid number"
    1              0.000003 set cursorline         " CursorLine
    1              0.000002 set hidden             " Lets you send buffers to backgrund whitout saving them
    1              0.000003 set noerrorbells       " No beeps on error
    1              0.000003 set title              " Set the title in GUI/screen mode
    1              0.000006 set encoding=utf-8     " Utf-8
    1              0.000003 set showmode           " Shows current mode under the status bar
    1              0.000002 set autowrite          " Autowrite on some commands (make)
    1              0.000003 set timeoutlen=1200    " A little bit more time for macros
    1              0.000003 set ttimeout
    1              0.000003 set ttimeoutlen=50     " Make Esc work faster
    1              0.000003 set showcmd            " Show commands as you type them
    1              0.000005 set complete-=i        " Smart complete
    1              0.000003 set laststatus=2       " Always show  status lines
    1              0.000004 set fileformats=unix,dos,mac    " Fileformat according to file
    1              0.000003 set backup             " Backup files
    1              0.000004 set backupskip+=*.tmp,crontab.* " Don't backup those files
    1              0.000006 set backupdir=~/.local/share/nvim/backup
    1              0.000003 set undodir=~/.local/share/nvim/undo
    1              0.000004 set wildmode=longest:full,full  " All options to command line completion
    1              0.000003 set wildignore+=*~,*.aux,tags,*/.git/*,*/.hg/*,*/.svn/* " ignore those files
                            " Section: Commands {{{1
                            " -----------------------
                            " Commands for vim command Line
                            "
                            
                            " `:SudoW`      prompts sudo to write a file  if vim is not executed as sudo
    1              0.000021 command! -bar -nargs=0 SudoW :setl nomod|silent exe 'write !sudo tee % >/dev/null'|let &mod = v:shell_error
                            " `:W`          fixes W typo
    1              0.000011 command! -bar -nargs=* -bang W :write<bang> <args>
                            " `:Rename xxx` renames current file to xxx
    1              0.000024 command! -bar -nargs=* -bang -complete=file Rename :
                                  \ let v:errmsg = ""|
                                  \ saveas<bang> <args>|
                                  \ if v:errmsg == ""|
                                  \ call delete(expand("#"))|
                                  \ endif
                            " Section: Mappings {{{1
                            " ----------------------
                            " ------
                            " Leader
    1              0.000008 let mapleader = "\<Space>"
    1              0.000004 let maplocalleader = "\<Space>"
                            " ------
    1              0.000007 nnoremap Y y$
                            " Remove highligh search
    1              0.000009 nmap <silent> <leader>/ :nohls<CR>
                            " ------
    1              0.000007 inoremap <C-C> <Esc>`^
                            " jj to esc and smarter k and j
    1              0.000004 nnoremap j gj
    1              0.000004 nnoremap k gk
    1              0.000005 inoremap jj <ESC>
                            " ------
                            " indents on paste
    1              0.000005 nnoremap =p m`=ap``
    1              0.000005 nnoremap == ==
    1              0.000006 vnoremap <M-<> <gv
    1              0.000005 vnoremap <M->> >gv
                            " inserts comment at the current line with vim settings
                            " ex:
                            " " -*- vim -*- vim:set ft=vim et sw=2 sts=2:
    1              0.000020 inoremap <C-X>^ <C-R>=substitute(&commentstring,' \=%s\>'," -*- ".&ft." -*- vim:set ft=".&ft." ".(&et?"et":"noet")." sw=".&sw." sts=".&sts.':','')<CR>
                            
                            " Common motions on insert and command mode
    1              0.000005 inoremap <M-o> <C-O>o
    1              0.000005 inoremap <M-O> <C-O>O
    1              0.000005 inoremap <M-I> <C-O>^
    1              0.000005 inoremap <M-A> <C-O>$
    1              0.000006 inoremap <CR>  <C-G>u<CR>
                            " -----------------------------------------
                            "unmapping annoying keys
    1              0.000006 noremap! <C-J> <Down>
    1              0.000006 noremap! <C-K><C-K> <Up>
    1              0.000005 nnoremap <up>    <nop>
    1              0.000005 nnoremap <down>  <nop>
    1              0.000005 nnoremap <left>  <nop>
    1              0.000008 nnoremap <right> <nop>
    1              0.000005 inoremap <up>    <nop>
    1              0.000005 inoremap <down>  <nop>
    1              0.000005 inoremap <left>  <nop>
    1              0.000005 inoremap <right> <nop>
                            "-----------------------
    1              0.000006 map <F1> <Esc>
    1              0.000006 map! <F1> <Esc>
    1              0.000006 map <F3> :cnext<CR>
    1              0.000006 map <F4> :cc<CR>
    1              0.000005 map <F5> :cprev<CR>
    1              0.000007 map <C-F4> :bdelete<CR>
    1              0.000016 map <Leader>l <Plug>CapsLockToggle
    1              0.000023 inoremap <silent> <C-G><C-T> <C-R>=repeat(complete(col('.'),map(["%Y-%m-%d %H:%M:%S","%a, %d %b %Y %H:%M:%S %z","%Y %b %d","%d-%b-%y","%a %b %d %T %Z %Y"],'strftime(v:val)')+[localtime()]),0)<CR>
                            " Merge consecutive empty lines and clean up trailing whitespace
    1              0.000011 map <Leader>fm :g/^\s*$/,/\S/-j<Bar>%s/\s\+$//<CR>
                            " --------------------------------------------------------------
                            " windows motions
    1              0.000005 map <C-h> <C-w>h
    1              0.000005 map <C-j> <C-w>j
    1              0.000005 map <C-k> <C-w>k
    1              0.000005 map <C-l> <C-w>l
    1              0.000005 map <C-+> <C-w>+
    1              0.000005 map <C--> <C-w>-
                            " ---------------
    1              0.000008 nnoremap <Leader>c mz"dyy"dp`z
    1              0.000008 vnoremap <Leader>c "dymz"dP`z
    1              0.000005 nnoremap ; :
    1              0.000005 nnoremap ,; ;
                            "PHP mappings
    1              0.000014 autocmd FileType php noremap L f$l
    1              0.000003 autocmd FileType php noremap H F$l
                            
                            """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                            
    1              0.000076 call plug#begin('~/.config/nvim/plugged')
    1              0.000360 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    1              0.000209 Plug 'SirVer/ultisnips'
    1              0.000198 Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
    1              0.000142 Plug 'dracula/vim'
    1              0.000137 Plug 'ervandew/supertab'
    1              0.000136 Plug 'godlygeek/tabular'
    1              0.000138 Plug 'honza/vim-snippets'
    1              0.000139 Plug 'iCyMind/NeoSolarized'
    1              0.000132 Plug 'mattn/emmet-vim'
    1              0.000133 Plug 'othree/html5.vim'
    1              0.000179 Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
    1              0.000133 Plug 'plasticboy/vim-markdown'
    1              0.000136 Plug 'scrooloose/nerdcommenter'
    1              0.000131 Plug 'scrooloose/nerdtree'
    1              0.000184 Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': ['javascript', 'javascript.jsx'] }
    1              0.000137 Plug 'vim-airline/vim-airline'
    1              0.000131 Plug 'tpope/vim-surround'
    1              0.000128 Plug 'Raimondi/delimitMate'
    1              0.000133 Plug 'vim-airline/vim-airline-themes'
    1              0.000203 Plug 'zenbro/mirror.vim'
    1              0.000149 Plug 'jreybert/vimagit'
    1              0.000136 Plug 'sheerun/vim-polyglot'
    1              0.000191 Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
    1              0.000142 Plug 'benekastah/neomake'
    1              0.000141 Plug 'tpope/vim-fugitive'
    1              0.000134 Plug 'airblade/vim-gitgutter'
    1              0.000233 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    1              0.000134 Plug 'junegunn/fzf.vim'
    1              0.000192 Plug 'pbogut/deoplete-padawan', { 'for' : ['php'] }
    1              0.000137 Plug 'metakirby5/codi.vim'
    1              0.000137 Plug 'rhysd/clever-f.vim'
                            
                            
    1   0.074062   0.000020 call plug#end()
                            
    1              0.000005 let g:airline_theme='dracula'
    1              0.000180 colorscheme dracula
    1              0.000007 let g:deoplete#enable_at_startup = 1
                            " omnifuncs
    1              0.000004 augroup omnifuncs
    1              0.000064   autocmd!
    1              0.000014   autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    1              0.000009   autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    1              0.000007   autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    1              0.000006   autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    1              0.000006   autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    1              0.000006   autocmd FileType php noremap L f$l
    1              0.000003   autocmd FileType php noremap H F$l
    1              0.000147   autocmd BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO if &ft == ""|set ft=text|endif
    1              0.000012   autocmd FileType c,cpp,cs,java setlocal ai et sta sw=4 sts=4 cin
    1              0.000010   autocmd FileType sh,csh,tcsh,zsh setlocal ai et sta sw=4 sts=4
    1              0.000010   autocmd FileType tcl,perl,python setlocal ai et sta sw=4 sts=4
    1              0.000009   autocmd FileType markdown,liquid setlocal ai et sta sw=2 sts=2 tw=72
    1              0.000006   autocmd FileType javascript setlocal ai et sta sw=2 sts=2 ts=2 cin isk+=$
    1              0.000011   autocmd FileType php,aspperl,aspvbs,vb setlocal ai et sta sw=4 sts=4
    1              0.000012   autocmd FileType apache,sql,vbnet setlocal ai et sta sw=4 sts=4
    1              0.000009   autocmd FileType tex,css,scss setlocal ai et sta sw=2 sts=2
    1              0.000012   autocmd FileType html,xhtml,wml,cf setlocal ai et sta sw=2 sts=2
    1              0.000009   autocmd FileType xml,xsd,xslt setlocal ai et sta sw=2 sts=2 ts=2
    1              0.000009   autocmd FileType eruby,yaml,ruby setlocal ai et sta sw=2 sts=2
    1              0.000006   autocmd FileType cucumber setlocal ai et sta sw=2 sts=2 ts=2
    1              0.000009   autocmd FileType text,txt,mail setlocal ai com=fb:*,fb:-,n:>
    1              0.000029   autocmd FileType c,cpp,cs,java,perl,javscript,php,aspperl,tex,css let b:surround_101 = "\r\n}"
    1              0.000006   autocmd FileType apache setlocal commentstring=#\ %s
    1              0.000012   autocmd FileType aspvbs,vbnet setlocal comments=sr:'\ -,mb:'\ \ ,el:'\ \ ,:',b:rem formatoptions=crq
    1              0.000006   autocmd FileType asp* runtime! indent/html.vim
    1              0.000005   autocmd FileType bst setlocal ai sta sw=2 sts=2
    1              0.000006   autocmd FileType cobol setlocal ai et sta sw=4 sts=4 tw=72 makeprg=cobc\ -x\ -Wall\ %
    1              0.000006   autocmd FileType cs silent! compiler cs | setlocal makeprg=gmcs\ %
    1              0.000007   autocmd FileType css silent! setlocal omnifunc=csscomplete#CompleteCSS
    1              0.000009   autocmd FileType git,gitcommit setlocal foldmethod=syntax foldlevel=1
    1              0.000004   autocmd FileType gitcommit setlocal spell
    1              0.000009   autocmd FileType help setlocal ai fo+=2n | silent! setlocal nospell
    1              0.000005   autocmd FileType html setlocal iskeyword+=~
    1              0.000007   autocmd FileType java silent! compiler javac | setlocal makeprg=javac\ %
    1              0.000005   autocmd FileType perl silent! compiler perl
    1              0.000005   autocmd FileType pdf setlocal foldmethod=syntax foldlevel=1
    1              0.000008   autocmd FileType text,txt setlocal tw=78 linebreak nolist
    1              0.000009   autocmd FileType tex silent! compiler tex | setlocal makeprg=latex\ -interaction=nonstopmode\ % formatoptions+=l
    1              0.000006   autocmd FileType vim setlocal ai et sta sw=2 sts=2 keywordprg=:help
    1              0.000002 augroup end
                            
    1              0.000008 if has_key(g:plugs, 'neomake')
                              " let g:neomake_verbose = 2
                              " let g:neomake_logfile = '/tmp/neomake.log'
                              " Disable phpcs by default
    1              0.000006   let g:neomake_php_enabled_makers = ['php', 'phpmd']
    1              0.000004   let g:neomake_javascript_enabled_makers = ['jshint']
    1              0.000003   let g:neomake_open_list=2
    1              0.000003   let g:neomake_list_height=5
    1              0.000008   autocmd! BufWritePost * Neomake
    1              0.000002 endif
                            
    1              0.000004 let g:deoplete#omni#functions = {}
    1              0.000008 let g:deoplete#omni#functions.javascript = [
                                  \ 'tern#Complete',
                                  \ 'jspc#omni'
                                  \]
                            " tern
    1              0.000006 if exists('g:plugs["tern_for_vim"]')
    1              0.000004   let g:tern_show_argument_hints = 'on_hold'
    1              0.000003   let g:tern_show_signature_in_pum = 1
    1              0.000008   autocmd FileType javascript setlocal omnifunc=tern#Complete
    1              0.000002 endif
    1              0.000014 set completeopt=longest,menuone,preview
    1              0.000004 let g:deoplete#sources = {}
    1              0.000006 let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
    1              0.000003 let g:tern#command = ['tern']
    1              0.000003 let g:tern#arguments = ['--persistent']
    1              0.000006 autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
    1              0.000004 let g:UltiSnipsExpandTrigger="<C-j>"
    1              0.000017 inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
                            " close the preview window when you're not using it
    1              0.000005 let g:SuperTabClosePreviewOnPopupClose = 1
    1              0.000005 let g:airline_powerline_fonts = 1
                            
    1              0.000006 if exists(':tnoremap')
    1              0.000009   tnoremap <Esc> <C-\><C-n>
    1              0.000002 endif
                            " copy the current text selection to the system clipboard
    1              0.000013 if has('gui_running') || has('nvim') && exists('$DISPLAY')
    1              0.000004   set clipboard=unnamed
    1              0.000010   noremap <Leader>y "+y
    1              0.000002 else
                              " copy to attached terminal using the yank(1) script:
                              " https://github.com/sunaku/home/blob/master/bin/yank
                              noremap <silent> <Leader>y y:call system('yank > /dev/tty', @0)<Return>
                            endif
                            " set incremental preview
    1              0.000005 set inccommand=split

