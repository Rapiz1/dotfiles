" Basic Settings {{{
set number
set hls
set go=
set autoread
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
" set expandtab
" set shiftround
set clipboard=unnamedplus
set noshowmode
" let g:airline_theme='jellybeans'
sy on
filetype plugin on
" }}}
" Mapping Settings {{{
let mapleader = ","
noremap<C-a> <Esc>ggvG$
inoremap { {}<Esc>i
" }}}
" Languages Specifics {{{
" C
function OpenC()
	set cindent
  set makeprg=g++\ %\ -Wall\ -g
  nnoremap <F12> :w<Enter>:make<Enter>
endfunction
function CreateC()
  0read ~/.vim/template/template.c
  :8
  :read !date -R
  execute "normal i *          "
  :13
endfunction

augroup cGroup
  autocmd!
  autocmd BufNewFile *.c call CreateC()
  autocmd FileType c call OpenC()
augroup END

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
endfunction

augroup filetype_py
  autocmd!
  autocmd FileType python call OpenPython()
augroup END
"}}}
" NREDCommenter Mapping {{{
let g:NERDCreateDefaultMappings = 0
vnoremap / :call NERDComment(1, 'toggle')<Enter>
vnoremap <leader>/ :call NERDComment(1, 'sexy')<Enter>
" }}}
" NERDTree Settings {{{
noremap <C-z> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}
" CtrlP-NERDTree Compatiable {{{
function! CtrlPCommand()
    let c = 0
    let wincount = winnr('$')
    " Don't open it here if current buffer is not writable (e.g. NERDTree)
    while !empty(getbufvar(+expand("<abuf>"), "&buftype")) && c < wincount
        exec 'wincmd w'
        let c = c + 1
    endwhile
    exec 'CtrlP'
endfunction
let g:ctrlp_cmd = 'call CtrlPCommand()'
" }}}
