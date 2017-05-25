set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.cache/dein'))
  call dein#begin(expand('~/.cache/dein'))
  call dein#add('/Users/xyos/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Raimondi/delimitMate')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('neomake/neomake')
  call dein#add('SirVer/ultisnips')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('carlitux/deoplete-ternjs', { 'on_ft': ['javascript', 'javascript.jsx'] })
  call dein#add('dracula/vim')
  call dein#add('ervandew/supertab')
  call dein#add('flowtype/vim-flow', { 'on_ft': ['javascript', 'javascript.jsx'] })
  call dein#add('honza/vim-snippets')
  call dein#add('iCyMind/NeoSolarized')
  call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'build': './install --all' })
  call dein#add('junegunn/fzf.vim')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('mattn/emmet-vim')
  call dein#add('mhartington/oceanic-next')
  call dein#add('othree/jspc.vim', { 'on_ft': ['javascript', 'javascript.jsx'] })

  call dein#add('plasticboy/vim-markdown')
  call dein#add('rhysd/clever-f.vim')
  call dein#add('sbdchd/neoformat')

  call dein#add('scrooloose/nerdtree')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('ternjs/tern_for_vim', { 'on_ft': ['javascript', 'javascript.jsx'] })
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rhubarb')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('zenbro/mirror.vim')
  call dein#end()
  call dein#save_state()

endif

filetype plugin indent on
syntax enable
