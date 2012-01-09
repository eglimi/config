" General settings
set nocompatible "be iMproved
set number       "show line numbers
set tenc=utf8    "terminal encoding is UTF-8
set enc=utf8     "character encoding is UTF-8
set laststatus=2 "always show status line

" vundle
filetype off " required for vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/UltiSnips'
Bundle 'vim-scripts/gnupg.vim'
Bundle 'vim-scripts/Wombat'

" Syntax
syntax on
filetype plugin indent on
set ts=2
set sw=2
nmap <Leader>ta :%!astyle --style=ansi --indent=tab --indent-switches --unpad-paren --keep-one-line-statements --keep-one-line-blocks --align-pointer=type --lineend-linux --suffix=none --quiet<CR>

" Menu / Completion
set wildmenu
set wildmode=list:longest,full
set completeopt=menuone,menu,longest,preview
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Search / Highlight
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set showcmd

" Colours
colorscheme wombat

" Runtime settings
runtime ftplugin/man.vim

" ctags
" Build tags of your own project with leader-tt
nmap <Leader>tt :call UpdateTags()<CR>

" cscope
nmap <Leader>css :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>csg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>csc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>cst :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>cse :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>csf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <Leader>csi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <Leader>csd :cs find d <C-R>=expand("<cword>")<CR><CR>

" file / buffer handling
nmap <silent> <Leader>ntt :NERDTreeToggle<CR>
nmap <silent> <Leader>ntf :NERDTreeFind<CR>
nmap <silent> <Leader>tb :TagbarToggle<CR>
" Open a buffer explorer (be) in CtrlP
nmap <Leader>be :CtrlPBuffer<CR>
set wildignore+=*.so,*.cpp.o,**/Build/**,**/build/**

" CtrlP
let g:ctrlp_max_height = 20

" git mappings
nmap <Leader>gg :!git gui &<CR><CR>
nmap <Leader>gv :!gitk --all &<CR><CR>

" Functions
func UpdateTags()
	execute "!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q ."
	execute "!cscope -b -R"
endfunc

