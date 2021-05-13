" ======================================================================
" URL: https://github.com/tomschwarz/dotfiles
" Author: Tom Schwarz
" Description: My personal, basic and minimal VIM config file.
" Colors: https://vimcolors.com - Here are really nice colorschemes
" ======================================================================

" Vundle config
" =============
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Raimondi/delimitMate'
call vundle#end()

" Basic options
" =============
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
set backspace=indent,eol,start
set colorcolumn=80
set ruler
set showcmd
set incsearch
set hlsearch
set nobackup
set nowb
set noswapfile
set smartindent
set smartcase
set noerrorbells
set list
filetype plugin indent on

" Hybrid line numbers
" ===================
set number relativenumber
set nu rnu

" Features
" ========
set nocompatible "Disable distro specific options
set wildmenu "Better command-line completion
filetype indent plugin on "Determine the type of a file

" Styling options
" ===============
syntax on

" Cursor options
" ==============
if &term == 'xterm-256color' || &term == 'screen-256color'
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
endif

" Usability options
" =================
set ignorecase
set smartcase
set ruler

" Keybindings
" ===========
nmap t :NERDTreeToggle<CR>
set pastetoggle=<F3>

" Markdown highlighting
" =====================
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
