set nocompatible

" Unmap the arrow keys
no <down> <Nop>
no <up> <Nop>
no <right> <Nop>
no <left> <Nop>

ino <down> <Nop>
ino <up> <Nop>
ino <right> <Nop>
ino <left> <Nop>

vno <down> <Nop>
vno <up> <Nop>
vno <right> <Nop>
vno <left> <Nop>

" Helpful navigation - buffers, windows, tabs
map <C-K> :bprev<CR>
map <C-J> :bnext<CR>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
" Resizing windows
nnoremap + <C-W>+<CR>
nnoremap - <C-W>-<CR>
" Not working yet...
nnoremap <S-left> <C-W>'<
nnoremap <S-right> <C-W>'>

" Apply . command in normal mode to any visual selection
vnoremap . :normal.<CR>
" Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Other custom mappings
map <F2> :help<Space>myhelp<CR>
nnoremap <F3> gg=G``zz
nmap <silent> ,\ :nohlsearch<CR>
cmap w!! w !sudo tee > /dev/null %

" vim-plug plugin manager
call plug#begin('~/.vim/plugins')
Plug 'junegunn/vim-emoji'
Plug 'tpope/vim-fugitive'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'valloric/youcompleteme'
call plug#end()

" enable rainbow brackets
let g:rainbow_active = 1

" setup emojis
set completefunc=emoji#complete
" manually insert emoji: CTRL-V in insert mode then enter hex unicode value
" CTRL-X CTRL-U in insert mode to get autocomplete menu
" remap F4 to replace emoji abbreviations
nnoremap <F4> :%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g <CR>

" Emoji shortcuts for common emojis
ab :smile: 😊
ab :) 😊
ab ;) 😉
ab :check_mark: ✅
ab :warning: ⚠
ab :bulb: 💡
ab :pushpin: 📌
ab :point_right: 👉
ab :point_left: 👈
ab :point_up: 👆
ab :point_down: 👇
ab :book: 📖
ab :link: 🔗
ab :wrench: 🔧
ab :info: 🛈
ab :telephone: 📞
ab :email: 📧
ab :computer: 💻

" Set some helpful general settings - use :help <cmd> to look these up
set showcmd
set autoread
set autowrite
set laststatus=2
set hidden
set number " line numbers
set cursorline
set ruler
set incsearch " searched strings are highlighted while typing
set wildmenu
set relativenumber
set hlsearch
set ignorecase
set smartcase
set mouse=a
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set nowrap
set linebreak
set scrolloff=3
set sidescrolloff=5
set confirm
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)
set undofile " persistent undo
set undodir=~/.vim/undodir
syntax enable
colorscheme desert

" Folds
set foldenable        "Enable folding
set foldlevelstart=10 "Open most of the folds by default. If set to 0, all folds will be closed.
set foldnestmax=10    "Folds can be nested. Setting a max value protects you from too many folds.
set foldmethod=manual "Defines the type of folding.

" highlight trailing whitespace
match ErrorMsg '\s\+$'
" remove trailing whitespaces automatically
autocmd BufWritePre * :%s/\s\+$//e

set keywordprg=google " run 'google' instead of man when K is pressed

" Below is the default settings from $VIMRUNTIME/vimrc_example.vim
" The commands in this are executed when the GUI is started, after the vimrc
" has been executed.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2016 Apr 05
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"	      for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"	    for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

" set ch=2		" Make command line two lines high

" set mousehide		" Hide the mouse when typing text

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Only do this for Vim version 5.0 and later.
if version >= 500

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " For Win32 version, have "K" lookup the keyword in a help file
  "if has("win32")
  "  let winhelpfile='windows.hlp'
  "  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
  "endif

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when ":lmap" mappings are active
  " Constants are not underlined but have a slightly lighter background
  highlight Normal guibg=grey90
  highlight Cursor guibg=Green guifg=NONE
  highlight lCursor guibg=Cyan guifg=NONE
  highlight NonText guibg=grey80
  highlight Constant gui=NONE guibg=grey95
  highlight Special gui=NONE guibg=grey95

endif
