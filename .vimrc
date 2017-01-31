" *****************************************************************************
"  REFERENCE MATERIAL
" *****************************************************************************

" http://items.sjbach.com/319/configuring-vim-right
" https://github.com/skwp/dotfiles/blob/master/vimrc
" https://github.com/alfredodeza/dotfiles/blob/master/.vimrc
" http://nvie.com/posts/how-i-boosted-my-vim/
" https://github.com/mitechie/pyvim/blob/master/.vimrc


filetype off

call plug#begin('~/.vim/plugged')

" General.
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
" Plug 'bling/vim-bufferline'

Plug 'chriskempson/base16-vim'
Plug 'fatih/vim-go'
Plug 'hashivim/vim-terraform'
"
" Files and buffers.
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
", { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/gv.vim'

Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'suan/vim-instant-markdown', { 'for': 'md' }

" Movement and editing.
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'

" Syntax
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-markdown'
Plug 'mustache/vim-mustache-handlebars', { 'for': ['hbs', 'handlebars'] }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'nsf/gocode',  { 'for': 'go' }
"
" Collection of language packs.
Plug 'sheerun/vim-polyglot'

Plug 'lambdalisue/vim-gista'

call plug#end()

" *****************************************************************************
"  GLOBAL CONFIGURATION
" *****************************************************************************

syntax on                         " Required.
filetype plugin indent on         " Required.

" " Encoding
" set encoding=utf-8
" set fileencoding=utf-8
" set fileencodings=utf-8

let mapleader=","                 " Comma is easier to get to than backslash.

" This is especially useful with the ctrlp plugin.
set wildmode=list:longest,list:full
set wildignore+=tmp,*.so,*.swp,*.zip,*.egg,*.min.js,pkg,github.com
set wildignore+=*.png,*.jpg,*.jpeg,*.gif,*.webp
set wildignore+=*.egg-info,.*,*.pyc,*.tar,*.gz,*.log,*.fla,*.swf
set wildignore+=env,node_modules,bower_components,target,build
set wildignore+=Godeps

" set t_Co=256                      " Use 256 colors where supported.
let base16colorspace=256
if filereadable(expand('~/.vimrc_background'))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" set guifont=Inconsolata-g\ for\ Powerline:h12
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h12

set spelllang=en_gb
" set spellfile=~/.vim/spell/en.utf-8.add

set clipboard+=unnamedplus

" -----------------------------------------------------------------------------
"  Editor
" -----------------------------------------------------------------------------

set background=dark

" Start gracefully when colorscheme is not installed.
try
  colorscheme base16-google-dark
catch
endtry

set number                        " Show line numbers.
set ruler
" set relativenumber                " Line numbers relative to current position.
set cursorline                    " Highlight current line.
set modelines=0                   " Don't parse modelines.
set history=1000                  " Sensible history.
set hlsearch                      " Highlight search terms...
set incsearch                     " ...dynamically as they are typed.
set ignorecase                    " Case insensitive search.
set smartcase                     " Case sensitive if upper case in search.
set title                         " Set the terminal title.
set shortmess=atI                 " Stifle many interruptive prompts.
set backspace=indent,eol,start    " Intuitive backspacing in insert mode.
set virtualedit=block             " Useful for column select.
set nowrap

set nobackup
set noswapfile

set laststatus=2                  " Always show the status line.


set fileformats=unix,dos,mac
set backspace=indent,eol,start
set showcmd

set shellcmdflag=-c               " Allow the shell to be non-interactive.

" Make tabs and trailing spaces visible when requested.
set listchars=tab:>-,trail:·
nmap <leader>l :set list!<CR>

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Auto complete.
set wildmenu                      " Make file/command completion useful.
set wildmode=list:longest

set hidden                        " Don't write to disk when loosing focus.

set scrolloff=3                   " Leave n lines above/below curser.

" " Encoding
" set encoding=utf-8
" set fileencoding=utf-8
" set fileencodings=utf-8

set colorcolumn=80                " Show a column highlight after 80 characters.

set noeb vb t_vb=                 " Disable the bell.

" Folding settings
set foldmethod=indent             " Fold based on indent.
set foldnestmax=10                " Deepest fold is 10 levels.
set nofoldenable                  " Don't fold by default.
set foldlevel=1                   " This is just what I use.

" -----------------------------------------------------------------------------
"  Indentation
" -----------------------------------------------------------------------------

set autoindent                    " Use indent from previous line.
set smartindent                   " Auto indenting on new line.
set smarttab                      " Smart handling of the tab key.
set shiftwidth=2                  " Number of columns for re-indent operations.
set softtabstop=2                 " Number of columns for tab key.
set tabstop=2                     " Tabs are 2 columns.
set expandtab                     " Expand tags to spaces on tab key.


" *****************************************************************************
"  PLUGIN CONFIGURATION
" *****************************************************************************

" Go related mappings
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap gd <Plug>(go-def-tab)

" go language
let s:tlist_def_go_settings = 'go;g:enum;s:struct;u:union;t:type;' .
                           \ 'v:variable;f:function'

let g:airline_powerline_fonts = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Powerline patched fonts are not rendering the symbols correctly in iTerm2
" so replace them with regular Unicode characters.
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#tabline#enabled = 1

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore="E126,E127,E128,W124"'

let g:syntastic_javascript_checkers = ['eslint']

let g:fzf_buffers_jump = 1

let g:tagbar_autoclose = 1

" gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:notes_directories = ['~/Google\ Drive/Notes']

set tags+=~/.vim/systags

" go to defn of tag under the cursor.
fun! MatchCaseTag()
    let ic = &ic
    set noic
    try
        exe 'tjump ' . expand('<cword>')
    finally
       let &ic = ic
    endtry
endfun
nnoremap <silent> <c-]> :call MatchCaseTag()<CR>


" *****************************************************************************
"  SYNTAX CONFIGURATION
" *****************************************************************************

" Map file types to syntax.
au BufRead *.hbs,*.handlebars set ft=mustache
au BufEnter *.schema setf json
" AWS CloudFormation templates and params
au BufEnter *.template setf json
au BufEnter *.params setf json
au BufEnter Jenkinsfile setf groovy
au BufNewFile,BufReadPost *.md set filetype=markdown
"
" Indentation.
au BufEnter *.html,*.hbs,*.jade,*.tmpl set tabstop=2 shiftwidth=2 tabstop=2
au BufEnter *.json set tabstop=2 shiftwidth=2 tabstop=2
au BufEnter *.py set tabstop=4 shiftwidth=4 tabstop=4 expandtab
au BufEnter *.snippets set tabstop=4 shiftwidth=4 noexpandtab
au BufEnter *.go set tabstop=4 shiftwidth=4 noexpandtab colorcolumn=


" *****************************************************************************
"  KEY MAPPINGS
" *****************************************************************************

" -----------------------------------------------------------------------------
"  Editor
" -----------------------------------------------------------------------------

" Easier exit of insert mode.
inoremap jj <Esc>
" Easier exit of insert mode into ex mode.
inoremap ;; <Esc> :

" Faster access to ex mode.
nnoremap ; :

" Use Esc to exit terminal insert mode.
" tnoremap <Esc> <C-\><C-n>

" tnoremap <A-h> <C-\><C-n><C-w>h
" tnoremap <A-j> <C-\><C-n><C-w>j
" tnoremap <A-k> <C-\><C-n><C-w>k
" tnoremap <A-l> <C-\><C-n><C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l

" Cycle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" -----------------------------------------------------------------------------
"  Commands
" -----------------------------------------------------------------------------

map <F8> :TagbarToggle<CR>
map <C-n> :NERDTreeToggle<CR>

" Fugitive (Git).
map <leader>gs :Gstatus<CR>
map <leader>gd :Gdiff<CR>
map <leader>gc :Gcommit<CR>
map <leader>gb :Gblame<CR>
map <leader>gl :Glog<CR>
map <leader>gp :Gpush<CR>

map <C-a> :FZF<CR>
map <C-p> :GitFiles<CR>
map <C-t> :Buffers<CR>

nmap <silent> <leader>s :set spell!<CR> " Toggle spellcheck.

set pastetoggle=<F2>              " Switch paste states on F2.

nmap <silent> ,/ :nohlsearch<CR>  " Shortcut to clearing search highlights.


set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" -----------------------------------------------------------------------------
"  Navigation
" -----------------------------------------------------------------------------

" Disable arrow keys in insert mode.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Window/viewport Navigation.
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>

" Scroll the viewport faster.
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>


" *****************************************************************************
"  COMMANDS AND FUNCTIONS
" *****************************************************************************

com! FormatJSON %!python -m json.tool

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun


" *****************************************************************************
"  EVERYTHING ELSE
" *****************************************************************************

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Better splits
"set winheight=30
"set winminheight=5

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Always split to right and bottom.
set splitbelow
set splitright

set tags=./tags,tags;$HOME

" Load private settings.
if filereadable(expand('~/.vimrc.private'))
  source ~/.vimrc.private
endif

hi TabLine      ctermfg=Black  ctermbg=DarkGray     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=DarkGray     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=Gray  cterm=NONE
hi LineNr       ctermbg=NONE  cterm=NONE

if has('nvim')

endif

