set nocompatible                  " We don't need vi compatibility.


" *****************************************************************************
"  REFERENCE MATERIAL
" *****************************************************************************

" http://items.sjbach.com/319/configuring-vim-right
" https://github.com/skwp/dotfiles/blob/master/vimrc
" https://github.com/alfredodeza/dotfiles/blob/master/.vimrc
" http://nvie.com/posts/how-i-boosted-my-vim/
" https://github.com/mitechie/pyvim/blob/master/.vimrc


" *****************************************************************************
"  VUNDLE SETUP AND BUNDLES
" *****************************************************************************

" Note: The vundle repo needs to be cloned in to .vim/bundle.
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

" Setup
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'

" General.
"Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'sjl/gundo.vim'
Plugin 'mkitt/tabline.vim'
Plugin 'embear/vim-localvimrc'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'berryp/calendar-vim'
Plugin 'mklabs/grunt.vim'
Plugin 'mattn/emmet-vim'
Plugin 'neochrome/todo.vim'

" Files and buffers.
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'
"Plugin 'vim-scripts/taglist.vim'
Plugin 'majutsushi/tagbar'
Plugin 'sjbach/lusty'
Plugin 'vim-scripts/diffchanges.vim'
Plugin 'mkomitee/vim-gf-python'

" Movement and editing.
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'tristen/vim-sparkup'
Plugin 'msanders/snipmate.vim'
Plugin 'nvie/vim-togglemouse'
Plugin 'Townk/vim-autoclose'

" Syntax
Plugin 'scrooloose/syntastic'
Plugin 'othree/html5.vim'
Plugin 'groenewege/vim-less'
Plugin 'mustache/vim-mustache-handlebars'
" Plugin 'jnwhiteh/vim-golang'
Plugin 'othree/javascript-libraries-syntax.vim'
"Plugin 'bradfitz/goimports'
"Plugin 'jnwhiteh/vim-golang'
Plugin 'fatih/vim-go'
"Plugin 'nsf/gocode', {'rtp': 'vim/'}


" Color schemes.
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'nanotech/jellybeans.vim' 
Plugin 'altercation/vim-colors-solarized'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-markdown'


" *****************************************************************************
"  GLOBAL CONFIGURATION
" *****************************************************************************

syntax on                         " Required.
filetype plugin indent on         " Required.

let mapleader=","                 " Comma is easier to get to than backslash.

" This is especially useful with the ctrlp plugin.
set wildignore+=tmp,*.so,*.swp,*.zip,node_nodules,env,*.egg,*.min.js
set wildignore+=*.egg-info,.*,*.pyc,*.tar,*.gz,*.log,*.fla,*.swf

set t_Co=256                      " Use 256 colors where supported.
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14

set spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add


" -----------------------------------------------------------------------------
"  Editor
" -----------------------------------------------------------------------------

" colorscheme Tomorrow-Night
colorscheme jellybeans

set number                        " Show line numbers.
set relativenumber                " Line numbers relative to current position.
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

set laststatus=2                  " Always show the status line.

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

set ttyscroll=10                  " Max lines to scroll the screen.
set encoding=utf-8                " Set the default encoding to UTF-8.
set nowrap                        " Disable line wrapping.

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

" Powerline patched fonts are not rendering the symbols correctly in iTerm2
" so replace them with regular Unicode characters.
" TODO: Figure out why patched fonts are not rendering, and fix.

let g:airline_powerline_fonts = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore="E126,E127,E128,W124"'

let g:syntastic_javascript_checkers = ['jshint']

let g:ctrlp_working_path_mode = 0 " Use working path mvim was opened from.
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules|env|tmp|build)$'

" Don't ask to load local vimrc.
" TODO: This doesn't seem to be working.
if (!exists("g:localvimrc_ask"))
  let g:localvimrc_ask = 0
else
  let g:localvimrc_ask = 0
endif

let g:calendar_diary=$HOME.'/.vim/diary'

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

" *****************************************************************************
"  SYNTAX CONFIGURATION
" *****************************************************************************

" Indentation.
au BufEnter *.html,*.hbs,*.json,*.jade,*.js set ts=2 sw=2 sts=2
au BufEnter *.py set ts=4 sw=4 sts=4
au BufEnter *.snippets set ts=4 sw=4 noexpandtab
au BufEnter *.go set ts=4 sw=4 noexpandtab

" Map file types to syntax.
au BufRead *.hbs,*.handlebars set ft=mustache
au BufRead *.xhtml set ft=html
au BufRead *.todo set ft=todo


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

" -----------------------------------------------------------------------------
"  Commands
" -----------------------------------------------------------------------------

map <F5> :Grunt build<CR>
map <F8> :TagbarToggle<CR>

" Fugitive (Git).
map <leader>gs :Gstatus<CR>
map <leader>gd :Gdiff<CR>
map <leader>gc :Gcommit<CR>
map <leader>gb :Gblame<CR>
map <leader>gl :Glog<CR>
map <leader>gp :Gpush<CR>

nmap <silent> <leader>s :set spell!<CR> " Toggle spellcheck.

set pastetoggle=<F2>              " Switch paste states on F2.

nmap <silent> ,/ :nohlsearch<CR>  " Shortcut to clearing search highlights.

noremap! <leader>cal :CalendarH<CR>
noremap! <leader>caL :Calendar<CR>

" TODO toggle
map <silent><buffer> <leader>tt :TodoToggle<cr>
imap <silent><buffer> <leader>tt <c-o>:TodoToggle<cr>

" -----------------------------------------------------------------------------
"  Navigation
" -----------------------------------------------------------------------------

" Disable arrow keys.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Window/viewport Navigation.
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Scroll the viewport faster.
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>


" *****************************************************************************
"  COMMANDS AND FUNCTIONS
" *****************************************************************************

com! FormatJSON %!python -m json.tool


" *****************************************************************************
"  EVERYTHING ELSE
" *****************************************************************************

" Load private settings.
if filereadable(expand('~/.vimrc.private'))
  source ~/.vimrc.private
endif

