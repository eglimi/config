" General settings
set nocompatible "be iMproved
set tenc=utf8    "terminal encoding is UTF-8
set enc=utf8     "character encoding is UTF-8
set laststatus=2 "always show status line
set bs=2         "backspace handling

" Numbering
set number         "show line numbers
" set colorcolumn=80 " 80 columns per line
set relativenumber


" vundle
filetype off " required for vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'SirVer/ultisnips'
Bundle 'vim-scripts/gnupg.vim'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'vim-scripts/Wombat'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'chazy/cscope_maps'
Bundle 'sjl/gundo.vim'
Bundle 'jnwhiteh/vim-golang'
"Bundle 'Rip-Rip/clang_complete'

" undo
set undofile
nnoremap <Leader>gu :GundoToggle<CR>

" Syntax
syntax on
filetype plugin indent on
set ts=2
set sw=2
nmap <Leader>ta :%!astyle --style=ansi --indent=tab --indent-switches --unpad-paren --keep-one-line-statements --keep-one-line-blocks --align-pointer=type --lineend=linux --suffix=none --quiet<CR>

" Menu / Completion
set wildmenu
set wildmode=list:longest,full
set completeopt=menuone,menu,longest,preview
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" clang completion
"let g:clang_complete_auto = 0
"let g:clang_use_library = 1

" Search / Highlight
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set showcmd
set cursorline

" Colours
colorscheme wombat
hi Cursor	guifg=NONE	guibg=sienna	gui=none "Overwrite curser color for wombat

" Runtime settings
runtime ftplugin/man.vim

" ctags
" Build tags of your own project with leader-tt
nmap <Leader>tt :call UpdateTags()<CR>


" file / buffer handling
nmap <silent> <Leader>ntt :NERDTreeToggle<CR>
nmap <silent> <Leader>ntf :NERDTreeFind<CR>
nmap <silent> <Leader>tb :TagbarToggle<CR>
" Open a buffer explorer (be) in CtrlP
" nmap <Leader>be :CtrlPBuffer<CR>
set wildignore+=*.so,*.cpp.o,*/Build/*,*/build/*
set wildignore+=*/.git*,*/.svn/*

" CtrlP
let g:ctrlp_max_height = 20
let g:ctrlp_dotfiles = 0

" Snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]

" git mappings
nmap <Leader>gg :!git gui &<CR><CR>
nmap <Leader>gv :!gitk --all &<CR><CR>

" Functions
func UpdateTags()
	execute "!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q ."
	execute "!cscope -b -R"
endfunc

