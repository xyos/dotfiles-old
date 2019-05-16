call plug#begin('~/.local/shared/nvim/plugged')

  Plug 'Raimondi/delimitMate' 
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'

  Plug 'plasticboy/vim-markdown'
  Plug 'rhysd/clever-f.vim'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'sodapopcan/vim-twiggy'
  Plug 'airblade/vim-gitgutter'

  " NERDTree
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  """
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dadbod'
  Plug 'tpope/vim-sleuth'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'

  Plug 'roxma/vim-tmux-clipboard'
  " Language Completion
  Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
  " Formating 
  Plug 'sbdchd/neoformat'
  " JavaScript & Web
  Plug 'RRethy/vim-hexokinase'
  Plug 'mattn/emmet-vim'
  " Elixir
  Plug 'elixir-lang/vim-elixir'
  Plug 'slashmili/alchemist.vim'
  Plug 'myusuf3/numbers.vim'
  " Snippets
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  " Colors / UI
  Plug 'Shougo/denite.nvim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'
  Plug 'mhartington/oceanic-next'
  Plug 'iCyMind/NeoSolarized'
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'dracula/vim'
  Plug 'rakr/vim-one'
  Plug 'fenetikm/falcon'
  " gui
  Plug 'equalsraf/neovim-gui-shim'
  " tests
  Plug 'janko-m/vim-test'
  " snippets
  Plug 'honza/vim-snippets'
call plug#end()


filetype plugin indent on
syntax enable

let g:airline_powerline_fonts = 1

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

" Coc nvim
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Nord
colorscheme nord
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1

" Css colors
let g:Hexokinase_ftAutoload = ['css', 'xml', 'html']
