"" Neovim: place in ~/AppData/Local/nvim/init.vim
set nocompatible    " set nocompatible must be the first line in init.vim
scriptencoding utf-8
filetype indent plugin on

"" Exit Insert mode
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>

"" Clipboard functionality (yank/paste from system)
"" (alternate way is to set clipboard=unnamedplus or clipboard=unnamed)
vnoremap <leader>Y "*y
nnoremap <leader>y "+y
nnoremap <leader>P "*p
vnoremap <leader>p "+p

"" https://vim.fandom.com/wiki/Insert_newline_without_entering_insert_mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" F3 - toggle list (display whitespace)
nnoremap <F3> :set list!<CR>

" toggle search highlighting
nnoremap <C-l> :set hlsearch!<CR>

"" Map Ctrl+i to insert a single character
nnoremap <C-i> i_<Esc>r
"" Map Ctrl+a to append a single character
nnoremap <C-a> a_<Esc>r

set listchars=eol:↵,tab:➝\ ,trail:~,extends:>,precedes:<,space:·

let g:rainbow_active = 1        " turn on rainbow brackets
let mapleader = "\<Space>"      " set <leader> key to spacebar
set autoread                    " reload file if it's changed outside vim
set backspace=indent,eol,start  " backspace key deletes in insert mode
set cc=120                      " set column border
set encoding=utf-8
set expandtab                   " pressing <TAB> inserts spaces
set formatoptions+=j            " remove comment leader when joining lines
set history=1000
set hlsearch                    " highlight matches
set ignorecase                  " default to case insensitive searching
set incsearch                   " search as characters are entered
set laststatus=2                " always show statusline
set lazyredraw
set mouse=v                     " middle-click paste
set nolist                      " show whitespace
set nostartofline
set noswapfile
set number relativenumber       " toggle hybrid line numbers
set number
set ruler                       " displays cursor position
set shiftround
set shiftwidth=4                " indentation setting
set showcmd                     " show last command in bottom bar
set showmatch                   " highlight matching brackets/parens
set smartcase
set smartindent
set softtabstop=4
set tabstop=4
set termguicolors               " true color terminal
set title
set ttimeoutlen=50              " keycode timeout length
set ttyfast
set undofile
set visualbell
set wildmenu                    " visual autocomplete for the command menu
set ww=<,>,[,],h,l,b,s          " allow cursor to wrap to previous/next line

" https://github.com/junegunn/vim-plug
call plug#begin()
    Plug 'tpope/vim-commentary'
    Plug 'itchyny/lightline.vim'
    Plug 'savq/melange'
    Plug 'smoka7/hop.nvim'
call plug#end()

" lightline.vim
set noshowmode
set laststatus=2
let g:lightline = { 'colorscheme': 'darcula', }

" hop.nvim
lua << EOF
    require('hop').setup()
EOF
map <Leader>w <cmd>HopWord<CR>
map <Leader>j <cmd>HopLineStartAC<CR>
map <Leader>k <cmd>HopLineStartBC<CR>
map <Leader>l <cmd>HopLine<CR>
map <Leader>f <cmd>HopChar1<CR>
map <Leader>; <cmd>HopChar2<CR>
map <Leader>/ <cmd>HopPattern<CR>

"" set tmp file directories
set backupdir=~/.vim/.backup/,/tmp//
set undodir=~/.vim/.undo/,/tmp//

"" Only use cursor line and column line in Insert mode
"" Only use relative line numbers in Normal Mode
autocmd InsertEnter * set cursorline cursorcolumn norelativenumber
autocmd InsertLeave * set nocursorline nocursorcolumn relativenumber

syntax enable
colorscheme melange

set viminfo+=n~/.vim/viminfo

"" set tmp file directories
set backupdir=~/.local/share/nvim//
set undodir=~/.local/share/nvim//

"" The rest of these are copied straight from
""" https://github.com/vim/vim/blob/master/runtime/defaults.vim

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
" Only xterm can grab the mouse events when using the shift key, for other
" terminals use ":", select text and press Esc.
if has('mouse')
    if &term =~ 'xterm'
        set mouse=a
    else
        set mouse=nvi
    endif
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd BufReadPost *
            \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
            \ |   exe "normal! g`\""
            \ | endif
