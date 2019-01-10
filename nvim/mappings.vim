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
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>g :Ag<CR>
nnoremap ; :
nnoremap ,; ;
"PHP mappings
autocmd FileType php noremap L f$l
autocmd FileType php noremap H F$l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if dein#tap('vim-easy-align')
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
endif

if dein#tap('coc.nvim')
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  " Use `[c` and `]c` for navigate diagnostics
  nmap <silent> [c <Plug>(coc-diagnostic-prev)
  nmap <silent> ]c <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K for show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if &filetype == 'vim'
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  vmap <leader>=  <Plug>(coc-format-selected)
  nmap <leader>=  <Plug>(coc-format-selected)

  " Setup formatexpr specified filetype(s).
  augroup mygroup
    autocmd!
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  vmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)

  " Use `:Format` for format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` for fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)
endif

if exists(':tnoremap')
  tnoremap <Esc> <C-\><C-n>
endif
" copy the current text selection to the system clipboard
if has('gui_running') || has('nvim') && exists('$DISPLAY')
  set clipboard=unnamed
  noremap <Leader>y "+y
else
  noremap <silent> <Leader>y y:call system('yank > /dev/tty', @0)<Return>
endif
