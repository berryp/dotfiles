set nocompatible                  " We don't need vi compatability.
filetype off                      " Required.

" Reference material for settings.
" http://items.sjbach.com/319/configuring-vim-right
" https://github.com/skwp/dotfiles/blob/master/vimrc
" https://github.com/alfredodeza/dotfiles/blob/master/.vimrc


" *****************************************************************************
" BUNDLES
" *****************************************************************************

" Setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" General.
Bundle 'tpope/vim-sensible'       " Some sensible defaults.
Bundle 'tpope/vim-fugitive'       " Git wrapper.
Bundle 'bling/vim-airline'        " Status/tabline enhancements.
Bundle 'sjl/gundo.vim'            " Graphical undo history.
Bundle 'mkitt/tabline.vim'        " Improved buffer tabs.
Bundle 'vim-scripts/CSApprox'     " gvim only color schemes in the terminal.
Bundle 'embear/vim-localvimrc'    " Source vimrc files in local dirs.

" Files and buffers.
Bundle 'Lokaltog/vim-easymotion'  " Simpler movement around files.
Bundle 'kien/ctrlp.vim'           " Open files using fuzzy search / regex.
Bundle 'vim-scripts/taglist.vim'  " Browse code files by symbols.

" Movement and editing.
Bundle 'tomtom/tcomment_vim'      " Commenting, similar to NERDCommenter.
Bundle 'tpope/vim-surround'       " Easily surround text with brackets, etc.
Bundle 'tristen/vim-sparkup'      " HTML expansion inspired by Zen Coding.
Bundle 'msanders/snipmate.vim'    " Textmate style snippets.

" Syntax
Bundle 'scrooloose/syntastic'     " Syntax checking.
Bundle 'othree/html5.vim'         " Extends html sytax highlighting for html5.
Bundle 'groenewege/vim-less'
Bundle 'mustache/vim-mustache-handlebars'

" Color schemes.
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'nanotech/jellybeans.vim' 


" *****************************************************************************
" GLOBAL SETTINGS
" *****************************************************************************

syntax on                         " Required.
filetype plugin indent on         " Required.

let mapleader=","                 " Comma is easier to get to than backslash.

" This is especially useful with the ctrlp plugin.
set wildignore+=tmp,*.so,*.swp,*.zip,node_nodules,env,*.egg,*.min.js
set wildignore+=*.egg-info,.*,*.pyc,*.tar,*.gz,*.log,*.fla,*.swf

set t_Co=256                      " Use 256 colors where supported.

" Editor.
color tomorrow-night

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
set virtualedit=block             " Useful for column select.

" Make tabs and trailing spaces visible when requested.
set listchars=tab:>-,trail:·
nmap <silent> <leader>s :set nolist!<CR>

" Store temporary files in central location.
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Auto complete.
set wildmenu                      " Make file/command completion useful.
set wildmode=list:longest

" Allow buffers to be put to the background without writing to disk.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

set ttyscroll=10                  " Max lines to scroll the screen.
set encoding=utf-8                " Set the default encoding to UTF-8.
set nowrap                        " Disable line wrapping.
set number                        " Show line numbers.

set colorcolumn=80                " Show a column highlight after 80 characters.

set noeb vb t_vb=                 " Disable the bell.

" Indentation
set autoindent                    " Use indent from previous line.
set smartindent                   " Auto indenting on new line.
set smarttab                      " Smart handling of the tab key.
set shiftwidth=2                  " Number of columns for reindent operations.
set softtabstop=2                 " Number of columns for tab key.
set tabstop=2                     " Tabs are 2 columns.
set expandtab                     " Expand tags to spaces on tab key.

set laststatus=2                  " Always show the status line.

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

set shellcmdflag=-c               " Tell the shell it is OK not to be interactive.


" *****************************************************************************
" PLUGIN SETTINGS
" *****************************************************************************

set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14

" Powerline patched fonts are not rendering the symbols correctly in iTerm2
" so replace them with regular Unicode characters.

let g:airline_powerline_fonts = 0

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

" Don't ask to load local vimrc.
if (!exists("g:localvimrc_ask"))
  let g:localvimrc_ask = 0
else
  let g:localvimrc_ask = 0
endif


" *****************************************************************************
" SYNTAX SETTINGS
" *****************************************************************************

" Indentation.
au BufEnter *.html,*.hbs,*.json,*.jade,*.js set ts=2 sw=2 sts=2
au BufEnter *.py set ts=4 sw=4 sts=4

" Map filetypes to syntax.
au BufRead *.hbs,*.handlebars set ft=mustache


" *****************************************************************************
" KEY MAPPINGS
" *****************************************************************************

" Disable arrow keys.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Easier exit of insert mode.
inoremap kj <Esc>

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

" Fugitive.
map <leader>gs :Gstatus<CR>
map <leader>gd :Gdiff<CR>
map <leader>gc :Gcommit<CR>
map <leader>gb :Gblame<CR>
map <leader>gl :Glog<CR>
map <leader>gp :Gpush<CR>


" *****************************************************************************
" FUNCTIONS
" *****************************************************************************

com! FormatJSON %!python -m json.tool


" *****************************************************************************
" EVERYTHING ELSE
" *****************************************************************************

" Load private settings.
if filereadable(expand('~/.vimrc.private'))
  source ~/.vimrc.private
endif

