:command E Explore

set number

set colorcolumn=80

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" This is needed in GUI Bash of Git on Windows, but not needed for Termux on Android
set autowrite

" Credit goes to http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre *.* :%s/\s\+$//e

