""
" Custom .gvimrc file
" 
" This is in the public domain, so feel free to use / change / redistribute it
" You can check the complete repository at http://github.com/motanelu/GVim-configuration
"
" Author: Tudor Barbu <hello@tudorbarbu.ninja>
" Blog: http://tudorbarbu.ninja
" License: LGPL
""

" Vilight colorscheme by Rob Robbins - http://robrobbins.info/?page_id=2
" Might not work with Vim (I use MacVim)
colorscheme vilight

" General options
syntax on
set title
set nocompatible
set number
set backspace=start,indent,eol
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autochdir
set incsearch
set ignorecase
set smartcase
set ls=2
set ruler
set showtabline=2
set formatoptions=qroct
set showcmd

" Key mappings - gui only
" ALT + arrow to switch tabs
noremap <A-Right> :tabnext<CR> 
noremap <A-Left> :tabprevious<CR> 

" Highlight problematic whitespace
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
