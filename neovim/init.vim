
" tUse Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" ================ General Config ====================
"

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set synmaxcol=200               "" try for a markdown fix
set laststatus=2                " for airline
set ttimeoutlen=50              " for airline

set ruler                         " Show cursor position.
set cursorline                    " Highlight current line

" set a visual columnn at the 80ths character
set colorcolumn=99


" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden
 
 
" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","
 
" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb
" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
" NOT WORKING: Didnt work when yanked right out of YADR
"silent !mkdir ~/.vim/backups > /dev/null 2>&1
"set undodir=~/.vim/backups
"set undofile
 
" ================ Indentation ======================
 
set autoindent
filetype plugin indent on
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on
 
" Display tabs and trailing spaces visually
 
set wrap       "Wrap lines
set linebreak    "Wrap lines at convenient points
 
" ================ Completion =======================

set list listchars=tab:»·,trail:· " Display extra whitespace
 
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
 
" ================ Scrolling ========================
 
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
 
" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle
filetype off
 
""""""""""""""""""""""""""""""""" MY VUNDLES """""""""""""""""""""""
call plug#begin('~/.vim/plugged')



" HEAVILY/MOSTLY taken from https://github.com/skwp/dotfiles 
 
 
" Make Git pervasive in vim ( :Gblame + Glog + many more )
"Bundle 'tpope/vim-fugitive'
 
" file navigator gutter
Plug 'ervandew/supertab'
Plug 'posva/vim-vue'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" awesome syntax highlighting
" TODO: Figure out how to enable correctly for Ruby.
Plug 'scrooloose/syntastic'

" status bar 
Plug 'bling/vim-airline'

" surround 
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
" markdown

" requires exuberant ctags
Plug  'majutsushi/tagbar'

Plug 'Yggdroot/indentLine'
"" 
"" ctrl p
Plug 'ctrlpvim/ctrlp.vim'

"" nerd commenter 
Plug 'scrooloose/nerdcommenter'

"" auto-delimeter close
Plug 'Raimondi/delimitMate'

"" tags for html
Plug 'vim-scripts/closetag.vim'

"" beter javascript
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
"" some of the options may suck so check it out.
Plug 'elzr/vim-json'

" vim line indenter
Plug 'nathanaelkane/vim-indent-guides'

"css tags

Plug 'skammer/vim-css-color'

" Add CSS3 syntax support to vim's built-in `syntax/css.vim`
Plug 'hail2u/vim-css3-syntax'

" go 
Plug 'fatih/vim-go'

" python
""""""
Plug 'gertjanreynaert/cobalt2-vim-theme'
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-jedi'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'mhartington/oceanic-next'
Plug 'sekel/vim-vue-syntastic'

""" JAVA 

Plug 'artur-shaik/vim-javacomplete2'

" END OF VUNDLE PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
 
" Color theme (drawing from altercation/vim-colors-solarized Bundle)
syntax enable


if (has("termguicolors"))
   set termguicolors
 endif
"""""""" COLOR SCHEME SETUP

set background=dark
"" colorscheme Lucario
colorscheme cobalt2-mf


"""""""" END COLOR SETUP

set mouse=a
set clipboard=unnamedplus
"turn on syntax highlighting
au FileType * setlocal formatoptions-=cro " turn off autocomment

let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set termencoding=utf-8
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_powerline_fonts = 1
set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types\ Mono:h11

" NERDTree Mappins
" Open Nerd Tree with <Leader>n
map <Leader>n <esc>:NERDTreeToggle<cr>
 
" Reveal current file in NERDTree with <Leader>r
map <Leader>r <esc>:NERDTreeFind<cr>
 
" ===== SYNTASTIC 
"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
"let g:syntastic_quiet_warnings=0
let g:syntastic_html_validator_parser="html5"


" Support for github flavored markdown
" via https://github.com/jtratner/vim-flavored-markdown
" with .md extensions

"" AIRLINE SETUP
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" trying to understand buffers """"""""""""""
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>
""""""""""""""""""""""""""""" END BUFFERS """"""""""""""""

"TERMINAL MODE REMAP

tnoremap <Esc> <C-\><C-n>

" ctrl-p


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_javascript_checkers = ['eslint']

"" python
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225'


let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

let g:ctrlp_working_path_mode = 'r'

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

let g:deoplete#enable_at_startup = 1
set rtp+=~/.vim/plugged/deoplete.nvim/
set rtp+=~/.vim/plugged/deoplete-jedi/
let g:deoplete#max_list = 10
  let g:jedi#_auto_initialize=1
  let g:jedi#force_py_version = 3
  let g:jedi#auto_vim_configuration = 1
  let g:jedi#popup_select_first = 0

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"let g:syntastic_debug = 3

"" get superTab to automatically close the windows
let g:SuperTabClosePreviewOnPopupClose = 1
let g:syntastic_disabled_filetypes=['html']

"" custom functions

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

noremap <leader>1 :call DeleteTrailingWS()<CR>

""" JAVA
""" endless options here
""" https://github.com/artur-shaik/vim-javacomplete2 
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"" syntastic turn off turn on
""noremap <C-w>e :SyntasticCheck<CR>
noremap <leader>5 :SyntasticToggleMode<CR>

"" trying to make it close the stupid preview window all the time
autocmd CompleteDone * pclose
