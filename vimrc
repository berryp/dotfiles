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
Bundle 'gmarik/vundle'

" General.
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'sjl/gundo.vim'
Bundle 'mkitt/tabline.vim'
Bundle 'vim-scripts/CSApprox'
Bundle 'embear/vim-localvimrc'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/calendar-vim'
Bundle 'mklabs/grunt.vim'
Bundle 'Valloric/YouCompleteMe'

" Files and buffers.
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'sjbach/lusty'

" Movement and editing.
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-surround'
Bundle 'tristen/vim-sparkup'
Bundle 'msanders/snipmate.vim'
Bundle 'nvie/vim-togglemouse'

" Syntax
Bundle 'scrooloose/syntastic'
Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
Bundle 'mustache/vim-mustache-handlebars'

" Color schemes.
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'nanotech/jellybeans.vim' 
Bundle 'altercation/vim-colors-solarized'
Bundle 'mhinz/vim-signify'
Bundle 'tpope/vim-markdown'


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

set spell spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add

" this is a plugin.

" -----------------------------------------------------------------------------
"  Editor
" -----------------------------------------------------------------------------

colorscheme Tomorrow-Night


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
set list
set listchars=tab:>-,trail:·
nmap <silent> <leader>s :set nolist!<CR>

" Store temporary files in central location.
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Auto complete.
set wildmenu                      " Make file/command completion useful.
set wildmode=list:longest

set hidden                        " Don't write to disk when loosing focus.

set ttyscroll=10                  " Max lines to scroll the screen.
set encoding=utf-8                " Set the default encoding to UTF-8.
set nowrap                        " Disable line wrapping.
set number                        " Show line numbers.

set colorcolumn=80                " Show a column highlight after 80 characters.

set noeb vb t_vb=                 " Disable the bell.

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


" *****************************************************************************
"  SYNTAX CONFIGURATION
" *****************************************************************************

" Indentation.
au BufEnter *.html,*.hbs,*.json,*.jade,*.js set ts=2 sw=2 sts=2
au BufEnter *.py set ts=4 sw=4 sts=4

" Map file types to syntax.
au BufRead *.hbs,*.handlebars set ft=mustache


" *****************************************************************************
"  KEY MAPPINGS
" *****************************************************************************

" -----------------------------------------------------------------------------
"  Editor
" -----------------------------------------------------------------------------

" Easier exit of insert mode.
inoremap kj <Esc>

" Faster access to ex mode.
nnoremap ; :

" -----------------------------------------------------------------------------
"  Commands
" -----------------------------------------------------------------------------

map <F5> :Grunt build<CR>
map <F8> :TlistToggle<CR>

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

map ev :e ~/.vimrc<CR>
map es :so ~/.vimrc<CR>

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

