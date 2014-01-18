set nocompatible
filetype off

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
Bundle 'Lokaltog/vim-powerline'
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

filetype plugin indent on

let mapleader=","

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_nodules/,env/

color jellybeans

set cursorline
set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
"set synmaxcol=128
set ttyscroll=10
set encoding=utf-8
set tabstop=2
set nowrap
set number
set expandtab
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase
set autoread

set colorcolumn=80

set noeb vb t_vb=

" ***********************************
" PLUGIN SETTINGS
" ***********************************

let g:syntastic_python_checkers=['flake8']
let g:syntastic_javascript_checkers=['jshint']
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules|env|tmp|build)$'

"let g:ctrlp_custom_ignore = {
"  \ 'dir': '\.git$|\.hg$|\.svn$|node_modules$|env$|tmp$|build$',
"  \ 'file': '\.jpg$|\.png$|\.jpg$|\.webp$|swf$' }


" ***********************************
" SYNTAX
" ***********************************

" Indentation.
au BufEnter *.html,*.hbs,*.json,*.jade,*.js set ts=2 sw=2 sts=2
au BufEnter *.py set ts=4 sw=4 sts=4

" Map filetypes to syntax.
au BufRead *.hbs,*.handlebars set ft=mustache


" KEYS

" Window/viewport Navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Plugins
map <F5> :Grunt build<cr>
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


