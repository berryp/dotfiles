set nocompatible
filetype off

" Reference material for settings.
" http://items.sjbach.com/319/configuring-vim-right
" https://github.com/skwp/dotfiles/blob/master/vimrc


" ***********************************
" BUNDLES
" ***********************************

" Setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'mklabs/grunt.vim'
Bundle 'groenewege/vim-less'
Bundle 'nanotech/jellybeans.vim'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'sjl/gundo.vim'
Bundle 'vim-scripts/taglist.vim'


" ***********************************
" GLOBAL SETTINGS
" ***********************************

" File-type highlighting and configuration.
syntax on
filetype on
filetype plugin on
filetype indent on

let mapleader=","

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_nodules/,env/,*.egg,*.egg-info,.*,*.pwc,*.tar,*.gz

set t_Co=256

" Editor.
color jellybeans

set relativenumber                " Line numbers relative to current position.
set cursorline                    " Highlight current line.
set expandtab                     " Expand tabs to spaces.
set modelines=0                   " Don't parse modelines.
set history=1000                  " Sensible history.
runtime macros/matchit.vim        " Enable extended % matching.
set ignorecase                    " Use case-smart searching.
set smartcase
set title                         " Set the terminal title.
set hlsearch                      " Highlight search terms...
set incsearch                     " ...dynamically as they are typed.
set shortmess=atI                 " Stifle many interruptive prompts.
set backspace=indent,eol,start    " Intuitive backspacing in insert mode.
set visualbell                    " No bell.

" Make tabs and trailing spaces visible when requested.
set listchars=tab:>-,trail:·
nmap <silent> <leader>s :set nolist!<CR>

" Store temporary files in central location.
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Auto complete.
set wildmenu                       " Make file/command completion useful.
set wildmode=list:longest

" Allow buffers to be put to the background without writing to disk.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

set ttyscroll=10
set encoding=utf-8
set nowrap
set number
set autoread
set clipboard=unnamed

set colorcolumn=80

set noeb vb t_vb=

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set laststatus=2

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber


" ***********************************
" PLUGIN SETTINGS
" ***********************************

" Use Unicode characters rather than powerline patched fonts.
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args = '--ignore="E126,E127,E128,W124"'

let g:syntastic_javascript_checkers=['jshint']

let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules|env|tmp|build)$'

"let g:ctrlp_custom_ignore = {
"  \ 'dir': '\.git$|\.hg$|\.svn$|node_modules$|env$|tmp$|build$',
"  \ 'file': '\.jpg$|\.png$|\.jpg$|\.webp$|swf$' }


" ***********************************
" SYNTAX SETTINGS
" ***********************************

" Indentation.
au BufEnter *.html,*.hbs,*.json,*.jade,*.js set ts=2 sw=2 sts=2
au BufEnter *.py set ts=4 sw=4 sts=4

" Map filetypes to syntax.
au BufRead *.hbs,*.handlebars set ft=mustache


" ***********************************
" KEY MAPPINGS
" ***********************************

" Disable arrow keys.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Window/viewport Navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Scroll the viewport faster.
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Plugins
map <F5> :Grunt build<CR>
map <F8> :TlistToggle<CR>

" Git
map <leader>gs :Gstatus<CR>
map <leader>gd :Gdiff<CR>
map <leader>gc :Gcommit<CR>
map <leader>gb :Gblame<CR>
map <leader>gl :Glog<CR>
map <leader>gp :Gpush<CR>


" ***********************************
" FUNCTIONS
" ***********************************

com! FormatJSON %!python -m json.tool


" ***********************************
" EVERYTHING ELSE
" ***********************************

" Load private settings.
if filereadable(expand('~/.vimrc.private'))
  source ~/.vimrc.private
endif

