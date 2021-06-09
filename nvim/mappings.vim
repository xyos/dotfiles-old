" Leader
map <space> <leader>
" ------
nnoremap Y y$
" Remove highligh search
nmap <silent> <leader>/ :nohls<CR>
" ------
inoremap <C-C> <Esc>`^
" jj to esc and smarter k and j
inoremap jj <Esc>
nnoremap j gj
nnoremap k gk
" ------
" indents on paste
nnoremap =p m`=ap``
nnoremap == ==
vnoremap <M-<> <gv
vnoremap <M->> >gv
" inserts comment at the current line with vim settings
" Common motions on insert and command mode
inoremap <M-o> <C-O>o
inoremap <M-O> <C-O>O
inoremap <M-I> <C-O>^
inoremap <M-A> <C-O>$
inoremap <CR>  <C-G>u<CR>
" -----------------------------------------
"unmapping annoying keys
noremap! <C-J> <Down>
noremap! <C-K><C-K> <Up>
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
"-----------------------
map <F1> <Esc>
map! <F1> <Esc>
map <F3> :cnext<CR>
map <F4> :cc<CR>
map <F5> :cprev<CR>
map <C-F4> :bdelete<CR>
" --------------------------------------------------------------
" windows motions
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-+> <C-w>+
map <C--> <C-w>-
" ---------------
nnoremap <Leader>y "*y
vnoremap <Leader>y "*y
nnoremap <Leader>p "*p
vnoremap <Leader>p "*p

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap ; :
nnoremap ,; ;
"PHP mappings
autocmd FileType php noremap L f$l
autocmd FileType php noremap H F$l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


if exists(':tnoremap')
  tnoremap <Esc> <C-\><C-n>
endif

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })


nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
