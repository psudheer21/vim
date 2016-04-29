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

let g:instant_markdown_slow = 1
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
set nowrap                      " Continue line outside of view
set colorcolumn=80              " set ruler at 80

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
autocmd FileType php        set omnifunc=phpcomplete#CompletePHP

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

" PHP complete
let g:phpcomplete_parse_docblock_comments = 1

" Awesome autocomplete
let g:ycm_min_num_of_chars_for_completion               = 2
let g:ycm_auto_trigger                                  = 1
let g:ycm_collect_identifiers_from_tags_files           = 1
let g:ycm_autoclose_preview_window_after_completion     = 1
let g:ycm_autoclose_preview_window_after_insertion      = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

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

" NERDTree management
nmap <leader>b :NERDTreeToggle<CR>

" configure tagbar to not show variables
let g:tagbar_type_php  = {
    \ 'ctagstype' : 'php',
    \ 'kinds'     : [
        \ 'n:namespaces',
        \ 'i:interfaces',
        \ 'c:classes',
        \ 'd:constant definitions',
        \ 'f:functions'
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

" Ultisnip config
let g:UltiSnipsExpandTrigger       = "<C-l>"
let g:UltiSnipsJumpForwardTrigger  = "<C-l>"
let g:UltiSnipsJumpBackwardTrigger = "<C-z>"
let g:UltiSnipsEditSplit           = "vertical"

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
    \    "eval_visual"    : "<Leader>e",
    \    "sspellchcket_breakpoint" : "<Leader>p"
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
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<Space>
nnoremap tm  :tabm<Space>
nnoremap tc  :tabclose<CR>
nnoremap <S-h> gT
nnoremap <S-l> gt

" Better colors for EasyMotion
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" Use powerline fonts
let g:airline_powerline_fonts = 1

" run syntactic checks
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list            = 0
let g:syntastic_check_on_wq              = 0
let g:syntastic_php_checkers             = ['php', 'phpcs']        " do not run phpmd
let g:syntastic_php_phpcs_args           = '-s -n --standard=PSR2' " always check against PSR2


" Add warnings to the status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" php code fixer
let g:php_cs_fixer_level    = "symfony"  " which level ?
let g:php_cs_fixer_config   = "default"  " configuration
let g:php_cs_fixer_php_path = "php"      " Path to PHP
let g:php_cs_fixer_verbose  = 1          " Return the output of
let g:php_cs_fixer_enable_default_mapping = 1       " <leader>pcf

" easytags
set tags=./.tags;

let g:easytags_dynamic_files = 1
let g:easytags_async = 1
let g:easytags_cmd           = '/usr/local/bin/ctags'
let g:easytags_languages     = {
\   'php': {
\     'cmd': g:easytags_cmd,
\       'args': ['--fields=+aimS'],
\       'fileoutput_opt': '-f',
\       'stdout_opt': '-f-',
\       'recurse_flag': '-R'
\   }
\}

" yank ring
let g:yankring_replace_n_pkey = '<C-y>'
let g:yankring_replace_n_nkey = '<C-u>'
let g:yankring_paste_using_g  = 0
nnoremap <leader>y :YRShow<cr>

" Newline auto indent
function EnterOrIndentTag()
    let line = getline(".")
    let col = getpos(".")[2]
    let before = line[col-2]
    let after = line[col-1]
    let opening = ["[", "{", "(", ">"]
    let closing = ["]", "}", ")", "<"]

    if index(opening, before) >= 0 && index(closing,after) >= 0
        return "\<Enter>\<C-o>O"
    endif
    return "\<Enter>"
endfunction

inoremap <expr> <Enter> EnterOrIndentTag()

let g:minimap_highlight='Visual'
