" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType javascript,javscript.jsx set formatprg=prettier\ --single-quote\ --stdin
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO if &ft == ""|set ft=text|endif
  autocmd FileType c,cpp,cs,java setlocal ai et sta sw=4 sts=4 cin
  autocmd FileType sh,csh,tcsh,zsh setlocal ai et sta sw=4 sts=4
  autocmd FileType tcl,perl,python setlocal ai et sta sw=4 sts=4
  autocmd FileType markdown,liquid setlocal ai et sta sw=2 sts=2 tw=72
  autocmd FileType javascript setlocal ai et sta sw=2 sts=2 ts=2 cin isk+=$
  autocmd FileType php,aspperl,aspvbs,vb setlocal ai et sta sw=4 sts=4
  autocmd FileType apache,sql,vbnet setlocal ai et sta sw=4 sts=4
  autocmd FileType tex,css,scss setlocal ai et sta sw=2 sts=2
  autocmd FileType html,xhtml,wml,cf setlocal ai et sta sw=2 sts=2
  autocmd FileType xml,xsd,xslt setlocal ai et sta sw=2 sts=2 ts=2
  autocmd FileType eruby,yaml,ruby setlocal ai et sta sw=2 sts=2
  autocmd FileType cucumber setlocal ai et sta sw=2 sts=2 ts=2
  autocmd FileType text,txt,mail setlocal ai com=fb:*,fb:-,n:>
  autocmd FileType c,cpp,cs,java,perl,javscript,php,aspperl,tex,css let b:surround_101 = "\r\n}"
  autocmd FileType apache setlocal commentstring=#\ %s
  autocmd FileType aspvbs,vbnet setlocal comments=sr:'\ -,mb:'\ \ ,el:'\ \ ,:',b:rem formatoptions=crq
  autocmd FileType asp* runtime! indent/html.vim
  autocmd FileType bst setlocal ai sta sw=2 sts=2
  autocmd FileType cobol setlocal ai et sta sw=4 sts=4 tw=72 makeprg=cobc\ -x\ -Wall\ %
  autocmd FileType cs silent! compiler cs | setlocal makeprg=gmcs\ %
  autocmd FileType css silent! setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType git,gitcommit setlocal foldmethod=syntax foldlevel=1
  autocmd FileType gitcommit setlocal spell
  autocmd FileType help setlocal ai fo+=2n | silent! setlocal nospell
  autocmd FileType html setlocal iskeyword+=~
  autocmd FileType java silent! compiler javac | setlocal makeprg=javac\ %
  autocmd FileType perl silent! compiler perl
  autocmd FileType pdf setlocal foldmethod=syntax foldlevel=1
  autocmd FileType text,txt setlocal tw=78 linebreak nolist
  autocmd FileType tex silent! compiler tex | setlocal makeprg=latex\ -interaction=nonstopmode\ % formatoptions+=l
  autocmd FileType vim setlocal ai et sta sw=2 sts=2 keywordprg=:help
augroup end
