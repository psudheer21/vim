let $PYTHONPATH=''
let $PYTHONUSERBASE=''

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
" set incsearch                   " Find as you type search
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
set tabstop=2                   " use 2 spaces for tabs
set shiftwidth=2
set smarttab
set softtabstop=2
set expandtab
" set incsearch
set ignorecase
set smartcase
set ls=2
set ruler
set showtabline=2
set formatoptions=qroct
set showcmd
set mouse=a                     " allow mouse usage for all modes (a)
set spelllang=en_us             " current language
" set cursorline                  " highlight the current line
set fileformat=unix             " unix file format by default
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set nowrap                      " Continue line outside of view
set textwidth=79
set colorcolumn=80              " set ruler at 80

set pastetoggle=<F2>
set ttymouse=sgr

" color scheme
let g:solarized_termcolors=1
let g:solarized_termtrans=1
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
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" slow multiple_cursors & YCM
function! Multiple_cursors_before()
    let g:ycm_auto_trigger = 0
endfunction

function! Multiple_cursors_after()
    let g:ycm_auto_trigger = 1
endfunction

" Tagbar management
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width=50
let g:tagbar_indent=1
let g:tagbar_sort = 0
" autocmd VimEnter * nested :TagbarOpen

" NERDTree management
nmap <F5> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 35
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" autocmd vimenter * NERDTree
" autocmd VimEnter * wincmd p
let g:nerdtree_tabs_open_on_console_startup=2
let g:nerdtree_tabs_smart_startup_focus=2

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

" map undo tree
nmap <F7> :UndotreeToggle<cr> 

" Quick file navigation
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" Remove whitespace on close
autocmd FileType c,cpp,java autocmd BufWritePre <buffer> call StripTrailingWhitespace()

" Find merge conflict marker
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

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

" select last pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" spellcheck toggle (on/off)
nmap <silent> <leader>s :set spell!<CR>

" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Use powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_detect_crypt=1

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

set encoding=utf-8

function! PropagatePasteBufferToOSX() range
  '<,'>y
  let @n=getreg('"')
  call system('pbcopy-remote', @n)
endfunction

function! PopulatePasteBufferFromOSX()
  let @+ = system('pbpaste-remote')
  echo "done"
endfunction

map <leader>c :call PropagatePasteBufferToOSX()<cr>

" Settings for vim-clang-format
let g:clang_format#style_options = { "BasedOnStyle" : "Google",
                                    \"ContinuationIndentWidth" : 2,
                                    \"ConstructorInitializerIndentWidth" : 2,
                                    \"ColumnLimit" : 79,
                                    \"KeepEmptyLinesAtTheStartOfBlocks" : "true",
                                    \"PointerAlignment" : "Right",
                                    \"BinPackParameters" : "false",
                                    \"ConstructorInitializerAllOnOneLineOrOnePerLine" : "true"}

let g:clang_format#auto_format = 0
"let g:clang_format#auto_format_on_insert_leave = 1
let g:clang_format#detect_style_file = 1
autocmd FileType c,cpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><Leader>cf :ClangFormat<CR>
nmap <Leader>f :ClangFormatAutoToggle<CR>
