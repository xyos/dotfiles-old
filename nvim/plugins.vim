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
  call dein#add('tpope/vim-dadbod')
  call dein#add('skywind3000/asyncrun.vim')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')

  call dein#add('roxma/vim-tmux-clipboard')
  " Language Completion
  call dein#add('neoclide/coc.nvim', {'build': 'yarn install'})
  " Linting
  call dein#add('w0rp/ale')
  " Formating 
  call dein#add('prettier/vim-prettier')
  " JavaScript & Web
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
  call dein#add('KeitaNakamura/neodark.vim')
  call dein#add('dracula/vim')
  call dein#add('rakr/vim-one')
  call dein#add('fenetikm/falcon')
  " gui
  call dein#add('equalsraf/neovim-gui-shim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

let g:falcon_lightline = 1
let g:airline_powerline_fonts = 1
let g:deoplete#enable_at_startup = 1
let g:dracula_colorterm = 1
colorscheme dracula

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

let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'true'
