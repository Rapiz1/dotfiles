" Basic Settings {{{
set number
set hls
set go=
set autoread
set autoindent
set shiftwidth=2
set tabstop=2
set expandtab
set shiftround
sy on
" }}}
" Mapping Settings {{{
let mapleader = ","
noremap<C-c> "+y
noremap<C-a> <Esc>ggvG
noremap<C-v> <Esc>"+p
inoremap { {}<Esc>i
" }}}
" Greetings {{{
autocmd VimEnter * echom "Happy Hacking:)"
"}}}
" Languages Specifics {{{
function CreateCPP()
  0read ~/.vim/template/template.cpp
  :8
  :read !date -R
  execute "normal i*          "
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
" autocmd BufNewFile *.cpp call CreateCPP()
  autocmd BufNewFile *.cxx call CreateCPP()
  autocmd FileType cpp call OpenCPP()
augroup END

augroup filetype_vim
  autocmd!
  " Enable code folding
  autocmd FileType vim setlocal foldmethod=marker
  " Map <Enter> for code folding
  nnoremap <Enter> za
augroup END
"}}}
