""
" Custom .vimrc file
" 
" This is in the public domain, so feel free to use / change / redistribute it
" You can check the complete repository at http://github.com/motanelu/GVim-configuration
"
" Author: Tudor Barbu <hello@tudorbarbu.ninja>
" Blog: http://tudorbarbu.ninja
" License: LGPL
""

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

source ~/.vim/vundle-plugins

call vundle#end()
filetype plugin indent on

" eof Vundle

" Remap the leader to something more comfortable
let mapleader=","

" turn syntax dection on
syntax on

" Generic config
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set list                        " Show problematic spaces
set guioptions-=T               " Remove the toolbar
set nobackup                    " no backup - use git like a normal person
set noswapfile                  " no swap file
set splitbelow                  " horizontal windows always split below
set splitright                  " vertical windows always split right
set completeopt-=preview
set title                       " show window title
set autoindent                  " autoindent when pressing Enter
set background=dark             " use a dark scheme
set tabstop=4                   " use 4 spaces for tabs
set shiftwidth=4
set softtabstop=4
set expandtab
set autochdir
set incsearch
set ignorecase
set smartcase
set ls=2
set ruler
set showtabline=2
set formatoptions=qroct
set showcmd
set mouse=a                     " allow mouse usage for all modes (a)
set spelllang=en_us             " current language
set cursorline                  " highlight the current line
set fileformat=unix             " unix file format by default
set fileformats=unix,dos,mac    " available formats
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" color scheme
colorscheme solarized

" Detect file types
autocmd BufRead,BufNewFile *httpd*.conf setfiletype apache "Apache config files
autocmd BufRead,BufNewFile .htaccess    setfiletype apache "htaccess files
autocmd BufRead,BufNewFile *inc         setfiletype php "PHP include files
autocmd BufRead,BufNewFile *phtml       setfiletype php "Zend framework templates

autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags

autocmd FileType crontab    setlocal nobackup nowritebackup

" Avoid typos
noremap :W :w
noremap :Q :q

" Kill sounds
set vb

" Configure CtrlP
let g:ctrlp_working_path_mode = 'r'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" PHP specials (next/previous variable)
noremap L f$ 
noremap H F$

" php documentor
inoremap <C-o> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-o> :call PhpDocSingle()<CR>
vnoremap <C-o> :call PhpDocRange()<CR> 

" Awesome autocomplete
let g:ycm_min_num_of_chars_for_completion               = 2
let g:ycm_auto_trigger                                  = 1
let g:ycm_collect_identifiers_from_tags_files           = 1
let g:ycm_autoclose_preview_window_after_completion     = 1
let g:ycm_autoclose_preview_window_after_insertion      = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0

" fix escape issue with YouCompleteMe & vim-autoclose (https://github.com/Valloric/YouCompleteMe/issues/9)
let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}

" slow multiple_cursors & YCM
function! Multiple_cursors_before()
    let g:ycm_auto_trigger = 0
endfunction

function! Multiple_cursors_after()
    let g:ycm_auto_trigger = 1
endfunction

" Tagbar management
nmap <leader>t :TagbarToggle<CR>

" configure tagbar to not show variables
let g:tagbar_type_php  = {
    \ 'ctagstype' : 'php',
    \ 'kinds'     : [
        \ 'i:interfaces',
        \ 'c:classes',
        \ 'd:constant definitions',
        \ 'f:functions',
        \ 'j:javascript functions:1'
    \ ]
\ }

" Quick file navigation
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" Remove whitespace on close
autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml,perl autocmd BufWritePre <buffer> call StripTrailingWhitespace()

" Yank 'till the end of the line
nnoremap Y y$

" Find merge conflict marker
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" need sudo?
cmap w!! w !sudo tee % >/dev/null

nnoremap <silent> <leader>q gwip

" Ultisnip config
let g:UltiSnipsExpandTrigger      ="<C-l>"
let g:UltiSnipsJumpForwardTrigger ="<C-l>"

" reset the search
nmap <silent> ,/ :nohlsearch<CR>

" StriTrailingWhitespace - taken from http://spf13.com
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Tabularize 
nmap <Leader>a=  :Tabularize /=<CR>
vmap <Leader>a=  :Tabularize /=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a:  :Tabularize /:<CR>
vmap <Leader>a:  :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>

" Vdebug config
" Key config ripped from http://thorpesystems.com/blog/debugging-php-in-vim/
let g:vdebug_keymap = {
    \    "run"            : "<Leader>'",
    \    "run_to_cursor"  : "<Leader><Down>",
    \    "step_over"      : "<Leader><Up>",
    \    "step_into"      : "<Leader><Left>",
    \    "step_out"       : "<Leader><Right>",
    \    "close"          : "q",
    \    "detach"         : "x",
    \    "sspellchcket_breakpoint" : "<Leader>p",
    \    "eval_visual"    : "<Leader>e"
\}

let g:vdebug_options = {
    \    "break_on_open" : 0,
\}

" map undo tree
nmap <leader>r :UndotreeToggle<cr> 

" select last pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" spellcheck toggle (on/off)
nmap <silent> <leader>s :set spell!<CR>

" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" CTRL + hjkl to move between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" using tabs
noremap tn :tabnew<cr>      " tn to open a new tab
noremap tc :tabclose<cr>    " tc to close the current tab

" Better colors for EasyMotion
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" Use powerline fonts
let g:airline_powerline_fonts = 1

" run syntactic checks
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
let g:syntastic_php_checkers             = ['php', 'phpcs']        " do not run phpmd
let g:syntastic_php_phpcs_args           = '-s -n --standard=PSR2' " always check against PSR2

" Add warnings to the status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Disable arrow keys - bad habit
" in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" php code fixer
let g:php_cs_fixer_level    = "symfony"      " which level ?
let g:php_cs_fixer_config   = "default"  " configuration
let g:php_cs_fixer_php_path = "php"      " Path to PHP
let g:php_cs_fixer_verbose  = 1          " Return the output of
let g:php_cs_fixer_enable_default_mapping = 1       " <leader>pcf
