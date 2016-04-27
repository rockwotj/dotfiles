if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Add or remove your plugins here:
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'

Plugin 'ctrlpvim/ctrlp.vim' 
Plugin 'Shougo/vimshell' 
Plugin 'majutsushi/tagbar' 
Plugin 'sheerun/vim-polyglot' 
Plugin 'fatih/vim-go' 
Plugin 'scrooloose/nerdtree' 
"Plugin 'Shougo/deoplete.nvim' 
"Plugin 'zchee/deoplete-go', {'build': {'unix': 'make'}} 
Plugin 'vim-airline/vim-airline' 
Plugin 'vim-airline/vim-airline-themes' 
Plugin 'dylanaraps/taskrunner.nvim' 
Plugin 'vim-scripts/BufOnly.vim' 
Plugin 'runoshun/vim-alloy' 
Plugin 'crusoexia/vim-monokai'

call vundle#end()            " required

"Syntax
syntax on
filetype plugin indent on

command Alloy !java -cp /Users/rockwotj/Applications/Alloy4.2_2015-02-22.app/Contents/Resources/Java/alloy4.2_2015-02-22.jar edu.mit.csail.sdg.alloy4whole.ExampleUsingTheCompiler '%:p'
command Yices !/Users/rockwotj/eclipse/yices-2.4.2/bin/yices '%:p'
autocmd BufNewFile,BufRead *.ys   set syntax=lisp


tnoremap <Esc> <C-\><C-n>

"Auto commands
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set number


syntax on                  " Enable syntax highlighting.

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

let python_highlight_all = 1
let python_version_2 = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#align_class = 1
let g:airline#extensions#tabline#enabled = 1
let g:taskrunner#focus_on_open = 1
"let g:polyglot_disabled = ['']

