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
  Plug 'ryanoasis/vim-devicons'
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
" colorscheme nord
" let g:nord_italic = 1
" let g:nord_underline = 1
" let g:nord_italic_comments = 1
let g:falcon_inactive = 1
let g:falcon_background = 0
let g:falcon_inactive = 1
let g:falcon_airline = 1
let g:airline_theme = 'falcon'
colorscheme falcon

" Css colors
let g:Hexokinase_ftAutoload = ['css', 'xml', 'html']
" Airline
let g:airline_extensions = ['branch', 'hunks', 'coc']
let g:airline_extensions = ['branch', 'hunks', 'coc']

" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]

let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'

let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" Configure error/warning section to use coc.nvim
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Hide the Nerdtree status line to avoid clutter
let g:NERDTreeStatusline = ''

" Disable vim-airline in preview mode
let g:airline_exclude_preview = 1

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1
