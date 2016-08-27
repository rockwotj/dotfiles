if &compatible
  set nocompatible               " Be iMproved
endif

set number

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =2         " Tab key indents by 2 spaces.
set shiftwidth  =2         " >> indents by 2 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

set list                   " Show non-printable characters.

if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" Required:
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Add or remove your plugins here:
Plugin 'sheerun/vim-polyglot' 
Plugin 'scrooloose/nerdtree' 
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'rockwotj/vim-snippets'
Plugin 'vim-airline/vim-airline' 
Plugin 'vim-airline/vim-airline-themes' 
Plugin 'dylanaraps/taskrunner.nvim' 
Plugin 'vim-scripts/BufOnly.vim' 
Plugin 'vim-scripts/Rename'
Plugin 'crusoexia/vim-monokai'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'fatih/vim-go'

call vundle#end()

"Syntax
syntax on

"Auto commands
"autocmd vimenter * NERDTree
"autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set exrc
set secure

" I always mistype these...
command WQ wq
command Wq wq
command W w
command Q q

" === THEMES ===

" Monokai Theme
let g:monokai_thick_border=1
colorscheme monokai
let g:airline_theme="murmur"
hi NERDTreeDir ctermfg=197
hi NERDTreeDirSlash ctermfg=197
" === END THEMES ===

let g:snips_email = "rockwotj@gmail.com"
let g:snips_github = "https://github.com/rockwotj"
let g:snips_author = "Tyler Rockwood"

let python_highlight_all = 1
let python_version_2 = 1

let g:neocomplete#enable_at_startup = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#align_class = 1
let g:airline#extensions#tabline#enabled = 1

let g:taskrunner#focus_on_open = 1

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

filetype plugin indent on
