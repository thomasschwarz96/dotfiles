" ======================================================================
"  _____ _                      ___     _                       ___  __  
" |_   _| |_  ___ _ __  __ _ __/ __| __| |___ __ ____ _ _ _ ___/ _ \/ / 
"   | | | ' \/ _ \ '  \/ _` (_-<__ \/ _| ' \ V  V / _` | '_|_ /\_, / _ \
"   |_| |_||_\___/_|_|_\__,_/__/___/\__|_||_\_/\_/\__,_|_| /__| /_/\___/
" ======================================================================
" URL: https://github.com/thomasschwarz96/vim-setup
" Author: Thomas Schwarz
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
set tabstop=4 
set number
set backspace=indent,eol,start
set ruler
set showcmd
set incsearch
set hlsearch
set nobackup
set nowb
set noswapfile
filetype plugin indent on

" Features
" ========
set nocompatible "Disable distro specific options
set wildmenu "Better command-line completion
filetype indent plugin on "Determine the type of a file

" Styling options
" ===============
syntax on
colorscheme solarized8_flat

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

