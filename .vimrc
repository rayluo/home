" After changing any content of this file, you can reload them into CURRENT buffer,
" by using ":source ~/.vimrc" command.
" Note: to do so, all your commands and functions need a trailing "!" to avoid E174.

:command! E Explore

set number

set colorcolumn=80

" Some Linux distro (such as antix 17) does not turn on syntax highlighting by default, so it is here.
syntax on

" In a codebase that uses 4 space characters for each indent, here are good settings to start with:
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" And then set different indent for html and javascript files
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" This is needed in GUI Bash of Git on Windows, but not needed for Termux on Android
set autowrite

" Credit goes to http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre *.* :%s/\s\+$//e

"" These lines give you a block cursor in Cygwin terminal.
"" Thanks http://superuser.com/questions/634326/how-can-i-get-a-block-cursor-in-vim-in-the-cygwin-terminal
"" This is at least better than nothing, since I can not find a way to highlight
"" the cursor and/or cursor line on Cygwin.
"" UPDATE: These lines cause the vim 7.x.x on Lubuntu 16.04.1 messing up lines
""         when editing. So I abandon this approach.
"let &t_ti.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[1 q"
"let &t_te.="\e[0 q"

" This seems the standard way to enable the cursor-line indicator (as underline)
" and it works for stock Lubuntu, Cygwin on Windows, Termux on Android.
set cursorline

" When a long line is wrapped, the "gk" and "gj" allow you to move up and down
" a visual line, while normal "k" and "j" move a physical line.
" The following settings map "gk" and "gj" to cursor <up> and <down>.
map <up> gk
map <down> gj
" And the following lines enables same <up> and <down> behavior in INSERT mode
imap <up> <C-[> <up>i
imap <down> <C-[> <down>i

" Enables mouse support so that we can switch vim window by simply clicking on them
set mouse=a

" Setup a shorthand for Python unitTest current file
" Currently only support the test file inside one level below project root
:command! PT :!python -m unittest -v %:h.%:t:r

