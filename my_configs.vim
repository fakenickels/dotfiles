" Set indentation
set ts=2 sw=2

" Write and close quickly
nmap <Leader>wq :wq<Cr>

" Clean up search highlights
nmap <C-n> :noh<Cr>

" Set default theme
colorscheme pablo

" Send all yanking/deleting ops to clipboard
set clipboard=unnamedplus

" Move a line of a text using Ctrl+[jk]
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z

" Syntastic
let g:syntastic_javascript_checkers = ['eslint', 'jshint']
" Prefer local executable
let g:flow#flowpath = exec('$(npm bin)/eslint')

" Show line numbers
set number

" Enable JSX for all js
let g:jsx_ext_required = 0

" Set up flow
let g:flow#flowpath = exec('$(npm bin)/flow')
if executable(g:flow#flowpath)
  let g:flow#enable = 1
else
  let g:flow#enable = 0
endif
