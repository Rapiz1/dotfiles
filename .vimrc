" Vim-plug Settings {{{
call plug#begin('~/.vim/plugged')
" Plug 'itchyny/lightline.vim'
" Plug 'zxqfl/tabnine-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
let g:indentLine_concealcursor = 'c'
Plug 'yggdroot/indentline'
Plug 'dag/vim-fish'
" Colorscheme
Plug 'mhartington/oceanic-next'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'arcticicestudio/nord-vim'
call plug#end()
" }}}
" Colorscheme {{{
sy on
set termguicolors
colo onehalfdark
let g:airline_powerline_fonts = 1
" }}}
" Basic Settings {{{
set number
set hls
set ignorecase
set go=
set autoread
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set clipboard=unnamedplus
set noshowmode
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
" coc.nvim {{{
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" }}}
" Assembly Synatx Settings {{{
au BufRead,BufNewFile *.asm set syntax=masm
" }}}
