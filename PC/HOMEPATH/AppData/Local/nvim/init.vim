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
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-commentary'
call plug#end()

" vim-easymotion
let g:EasyMotion_do_mapping = 0             " disable default mappings
let g:EasyMotion_smartcase = 1              " case-insensitive
let g:EasyMotion_startofline = 0            " keep cursor column when jk motion

"" use both SPACE and BACKSPACE because it works well with my Ergodox layout
nnoremap <space>; <Plug>(easymotion-s2)     " 2-char search
nnoremap <space>F <Plug>(easymotion-bd-F)   " move to char
nnoremap <space>f <Plug>(easymotion-bd-f)   " move to char
nnoremap <space>h <Plug>(easymotion-linebackward)
nnoremap <space>j <Plug>(easymotion-j)
nnoremap <space>k <Plug>(easymotion-k)
nnoremap <space>L <Plug>(easymotion-bd-jk)  " move to line
nnoremap <space>l <Plug>(easymotion-lineforward)
nnoremap <space>s <Plug>(easymotion-s2)     " 2-char search
nnoremap <space>W <Plug>(easymotion-w)      " word motion
nnoremap <space>w <Plug>(easymotion-bd-w)   " word motion
nnoremap <BS>; <Plug>(easymotion-s2)        " 2-char search
nnoremap <BS>F <Plug>(easymotion-bd-F)      " move to char
nnoremap <BS>f <Plug>(easymotion-bd-f)      " move to char
nnoremap <BS>h <Plug>(easymotion-linebackward)
nnoremap <BS>j <Plug>(easymotion-j)
nnoremap <BS>k <Plug>(easymotion-k)
nnoremap <BS>L <Plug>(easymotion-bd-jk)     " move to line
nnoremap <BS>l <Plug>(easymotion-lineforward)
nnoremap <BS>s <Plug>(easymotion-s2)        " 2-char search
nnoremap <BS>W <Plug>(easymotion-w)         " word motion
nnoremap <BS>w <Plug>(easymotion-bd-w)      " word motion

"" use easymotion with searches
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"" set tmp file directories
set backupdir=~/.vim/.backup/,/tmp//
set undodir=~/.vim/.undo/,/tmp//

"" Only use cursor line and column line in Insert mode
"" Only use relative line numbers in Normal Mode
autocmd InsertEnter * set cursorline cursorcolumn norelativenumber
autocmd InsertLeave * set nocursorline nocursorcolumn relativenumber

syntax enable
colorscheme habamax

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
