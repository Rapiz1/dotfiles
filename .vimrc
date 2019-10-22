" Basic Settings {{{
set number
set hls
set go=
set autoread
set autoindent
set shiftwidth=2
set tabstop=2
" set expandtab
" set shiftround
set clipboard=unnamedplus
sy on
" }}}
" Mapping Settings {{{
let mapleader = ","
noremap<C-a> <Esc>ggvG$
inoremap { {}<Esc>i
" }}}
" Greetings {{{
function ShowGreeting()
  echom "Happy Hacking:)"
endfunction
autocmd VimEnter * call ShowGreeting()
"}}}
" Languages Specifics {{{
" CPP
function CreateCPP()
  0read ~/.vim/template/template.cpp
  :8
  :read !date -R
  execute "normal i *          "
  :14
endfunction 

function OpenCPP()
  set cindent
  set makeprg=g++\ %\ -Wall\ -g
  nnoremap <F10> :!konsole -e 'sh -c "./a.out;read -p done;"'<Enter>
  nnoremap <F12> :w<Enter>:make<Enter>
endfunction

augroup cppGroup
  autocmd!
" .cxx is recommended
  autocmd BufNewFile *.cxx call CreateCPP()
  autocmd FileType cpp call OpenCPP()
augroup END

" Vim
function OpenVimConfig()
  " Enable code folding
  " Map <Enter> for code folding
  setlocal foldmethod=marker
  nnoremap <Enter> za
endfunction

augroup filetype_vim
  autocmd!
  autocmd FileType vim call OpenVimConfig()
augroup END

" Python
function OpenPython()
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set expandtab
  set autoindent
endfunction

augroup filetype_py
  autocmd!
  autocmd FileType python call OpenPython()
augroup END
"}}}
