set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.cache/dein'))
  call dein#begin(expand('~/.cache/dein'))
  call dein#add('/Users/xyos/.cache/dein/repos/github.com/Shougo/dein.vim') " Installs plugins
  call dein#add('Raimondi/delimitMate') 
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('neomake/neomake')
  call dein#add('SirVer/ultisnips')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('carlitux/deoplete-ternjs', { 'on_ft': ['javascript', 'javascript.jsx'] })
  call dein#add('dracula/vim')
  call dein#add('flowtype/vim-flow', { 'on_ft': ['javascript', 'javascript.jsx'] })
  call dein#add('honza/vim-snippets')
  call dein#add('iCyMind/NeoSolarized')
  call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'build': './install --all' })
  call dein#add('junegunn/fzf.vim')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('mattn/emmet-vim')
  call dein#add('mhartington/oceanic-next')
  call dein#add('othree/jspc.vim', { 'on_ft': ['javascript', 'javascript.jsx'] })
  " Elixir
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('slashmili/alchemist.vim')
  call dein#add('myusuf3/numbers.vim')

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

let g:oceanic_next_terminal_bold = 1
let g:airline_theme='oceanicnext'
let g:oceanic_next_terminal_italic = 1

if dein#tap('tern_for_vim')
  let g:tern#command = ['tern']
  let g:tern#arguments = ['--persistent']
endif

if dein#tap('vim-flow')
  let g:flow#autoclose = 1
endif

let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'php': ['phpmd']
      \}
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
      \ 'tern#Complete',
      \]
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['ternjs', 'file', 'ultisnips', 'buffer']
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger='<C-j>'
" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1
let g:airline_powerline_fonts = 1
call neomake#configure#automake('w')
let g:neomake_javascript_jsx_enabled_makers = ['eslint']
