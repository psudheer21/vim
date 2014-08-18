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

" Check syntax when saving a buffer
autocmd BufWritePost *.php !php -d display_errors=on -l <afile> 
autocmd BufWritePost *.inc !php -d display_errors=on -l <afile>
autocmd BufWritePost *.phtml !php -d display_errors=on -l <afile>
autocmd BufWritePost *.thtml !php -d display_errors=on -l <afile>
autocmd BufWritePost *.ctp !php -d display_errors=on -l <afile>
autocmd BufWritePost *httpd*.conf !/etc/rc.d/init.d/httpd configtest
autocmd BufWritePost *.bash !bash -n <afile>
autocmd BufWritePost *.sh !bash -n <afile>
autocmd BufWritePost *.pl !perl -c <afile>
autocmd BufWritePost *.perl !perl -c <afile>
autocmd BufWritePost *.xml !xmllint --noout <afile>
autocmd BufWritePost *.xsl !xmllint --noout <afile>
autocmd BufWritePost *.js !~/jslint/jsl -conf ~/jslint/jsl.default.conf -nologo -nosummary -process <afile>
autocmd BufWritePost *.rb !ruby -c <afile>
autocmd BufWritePost *.py !python -c "import py_compile; py_compile.compile(r'<afile>')"

" Detect file types
autocmd BufRead,BufNewFile *httpd*.conf setfiletype apache "Apache config files
autocmd BufRead,BufNewFile .htaccess    setfiletype apache "htaccess files
autocmd BufRead,BufNewFile *inc         setfiletype php "PHP include files
autocmd BufRead,BufNewFile *phtml       setfiletype php "Zend framework templates
autocmd BufRead,BufNewFile *thtml       setfiletype php "CakePHP templates
autocmd BufRead,BufNewFile *ctp         setfiletype php "CakePHP templates

autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        set omnifunc=phpcomplete_extended#CompletePHP

" PHP specials (next/previous variable)
noremap L f$ 
noremap H F$

" Force the ZF filetype for PHP files
autocmd FileType php set ft=php.zf
"
" Force the django filetype for python files
autocmd FileType python set ft=python.django

" Avoid typos
noremap :W :w
noremap :Q :q

" Kill sounds
set vb

" php documentor
inoremap <C-o> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-o> :call PhpDocSingle()<CR>
vnoremap <C-o> :call PhpDocRange()<CR> 

" Configure CtrlP
let g:ctrlp_working_path_mode = 'r'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Awesome autocomplete
let g:ycm_min_num_of_chars_for_completion               = 2
let g:ycm_auto_trigger                                  = 1
let g:ycm_collect_identifiers_from_tags_files           = 1
let g:ycm_autoclose_preview_window_after_completion     = 1
let g:ycm_autoclose_preview_window_after_insertion      = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0


let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

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
set foldenable                  " Auto fold code
set list
set guioptions-=T               "Remove the toolbar   
set lines=40                    " 40 lines instead of 24
set cot+=menuone
set nobackup                    " no backup - use git like a normal person
set noswapfile                  " no swap file
set undofile                    " Save undo's after file closes
set undodir=$HOME/.vim/undo     " where to save undo histories
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo

" Remove whitespace on close
autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml,perl autocmd BufWritePre <buffer> call StripTrailingWhitespace()

nnoremap Y y$
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

" auto-(save|load) the session without asking
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'

" Tabularize 
nmap <Leader>a=  :Tabularize /=<CR>
vmap <Leader>a=  :Tabularize /=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a:  :Tabularize /:<CR>
vmap <Leader>a:  :Tabularize /:<CR>

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
    \    "set_breakpoint" : "<Leader>p",
    \    "eval_visual"    : "<Leader>e"
    \}

let g:vdebug_options = {
    \    "break_on_open" : 0,
    \}


" Custom composer command
let g:phpcomplete_index_composer_command = '/usr/local/bin/composer'


" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" map tagbar
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

" map undo tree
nmap <leader>r :UndotreeToggle<cr> 

" exclude list for the line numbers plugin
let g:numbers_exclude = ['tagbar', 'undotree', 'nerdtree']

