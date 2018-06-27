set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.cache/dein'))
  call dein#begin(expand('~/.cache/dein'))
  call dein#add('/Users/xyos/.cache/dein/repos/github.com/Shougo/dein.vim') " Installs plugins
  call dein#add('Raimondi/delimitMate') 
  call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'build': './install --all' })
  call dein#add('junegunn/fzf.vim')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('mattn/emmet-vim')

  call dein#add('plasticboy/vim-markdown')
  call dein#add('rhysd/clever-f.vim')
  call dein#add('sbdchd/neoformat')

  call dein#add('scrooloose/nerdtree')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-fugitive')
  call dein#add('sodapopcan/vim-twiggy')
  call dein#add('tpope/vim-rhubarb')
  call dein#add('tpope/vim-dadbod')
  call dein#add('skywind3000/asyncrun.vim')
  call dein#add('tpope/vim-vinegar')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-surround')
  call dein#add('w0rp/ale')
  call dein#add('tpope/vim-unimpaired')

  call dein#add('roxma/vim-tmux-clipboard')
  " Language Completion
  call dein#add('autozimu/LanguageClient-neovim', {'rev' : 'next', 'build' : 'bash install.sh'})
  " JavaScript & Web
  call dein#add('sourcegraph/javascript-typescript-langserver')
  call dein#add('Microsoft/vscode-json-languageservice')
  call dein#add('Microsoft/vscode-css-languageservice')
  call dein#add('Microsoft/vscode-html-languageservice')
  call dein#add('ap/vim-css-color')
  " Elixir
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('slashmili/alchemist.vim')
  call dein#add('myusuf3/numbers.vim')

  " Snippets
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  " Colors / UI
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('mhartington/oceanic-next')
  call dein#add('iCyMind/NeoSolarized')
  call dein#add('dracula/vim')
  call dein#add('rakr/vim-one')
  call dein#add('fenetikm/falcon')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

let g:falcon_lightline = 1
let g:airline_powerline_fonts = 1

let NERDTreeHijackNetrw=1

imap <C-n>     <Plug>(neosnippet_expand_or_jump)
smap <C-n>     <Plug>(neosnippet_expand_or_jump)
xmap <C-n>     <Plug>(neosnippet_expand_target)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" LanguageClient 
let g:LanguageClient_serverCommands = {
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
