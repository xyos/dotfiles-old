set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.cache/dein'))
  call dein#begin(expand('~/.cache/dein'))
  call dein#add('/Users/xyos/.cache/dein/repos/github.com/Shougo/dein.vim') " Installs plugins
  call dein#add('Raimondi/delimitMate') 
  call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'build': './install --all' })
  call dein#add('junegunn/fzf.vim')
  call dein#add('junegunn/vim-easy-align')

  call dein#add('plasticboy/vim-markdown')
  call dein#add('rhysd/clever-f.vim')

  " Git
  call dein#add('tpope/vim-fugitive')
  call dein#add('junegunn/gv.vim')
  call dein#add('sodapopcan/vim-twiggy')
  call dein#add('airblade/vim-gitgutter')

  " NERDTree
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  """
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tpope/vim-commentary')
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
  call dein#add('sbdchd/neoformat')
  call dein#add('prettier/vim-prettier')
  " JavaScript & Web
  call dein#add('RRethy/vim-hexokinase')
  call dein#add('mattn/emmet-vim')
  " Elixir
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('slashmili/alchemist.vim')
  call dein#add('myusuf3/numbers.vim')
  " Snippets
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  " Colors / UI
  call dein#add('Shougo/denite.nvim')
  call dein#add('arcticicestudio/nord-vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('mhartington/oceanic-next')
  call dein#add('iCyMind/NeoSolarized')
  call dein#add('KeitaNakamura/neodark.vim')
  call dein#add('dracula/vim')
  call dein#add('rakr/vim-one')
  call dein#add('fenetikm/falcon')
  " gui
  call dein#add('equalsraf/neovim-gui-shim')
  " tests
  call dein#add('janko-m/vim-test')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

let g:falcon_lightline = 1
let g:airline_powerline_fonts = 1
let g:deoplete#enable_at_startup = 1
let g:dracula_colorterm = 1
colorscheme nord

let NERDTreeHijackNetrw=1

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" LanguageClient 

let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'true'

" Nord
if dein#tap('nord')
  let g:nord_italic = 1
  let g:nord_underline = 1
  let g:nord_italic_comments = 1
endif

if dein#tap('ale')

  " Lint always in Normal Mode
  let g:ale_lint_on_text_changed = 'normal'

  " Lint when leaving Insert Mode but don't lint when in Insert Mode 
  let g:ale_lint_on_insert_leave = 1

  " Set ALE's 200ms delay to zero
  let g:ale_lint_delay = 0
endif
if dein#tap('vim-hexokinase')
  let g:Hexokinase_ftAutoload = ['css', 'xml', 'html']
endif
