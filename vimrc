" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" use extended function of vim
set nocompatible
set encoding=utf-8

" make backspace work like most other apps
set backspace=2

" Scroll before the cursor reaches bottom or top of screen
set scrolloff=5

" Set another <Leader> key
let mapleader = ","

" Bind nohl
" Removes highlight of your last search
noremap  <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quick save command
noremap  <C-Z> :<C-u>w<CR>
inoremap <C-Z> <ESC>:w<CR>a
nnoremap <C-Z> :w<CR>

" Quick quit command
noremap <Leader>e :quit<CR> " Quit curent window
noremap <Leader>E :qa!<CR>  " Quit all winodws

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" easier moving between splits
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv


" Jump to subject (who needs Umlauts in normal mode?)
nnoremap ü <C-]>
nnoremap ä <C-O>

" Color scheme
set t_Co=256
colorscheme molokai

" syntx highlighting
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and leght
set number

" Other useful settings
set history=500
set undolevels=500

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Diasble backup and swap files
set nobackup
set nowritebackup
set noswapfile


" Setup Pathogen to manage your plugins
call pathogen#infect()


" Settings vor vim-powerline
" github.com/Lokaltog/powerline
set laststatus=2

" Settings for ctrlp
" github.com/kien/ctrlp.vim
set wildignore+=*.pyc

" Settings for Quicktasks
let g:quicktask_snip_path = '~/todo/snips'

" Set Markdown Syntax for .md files
au BufRead,BufNewFile *.md set filetype=markdown

" Flake8 Ignore
let g:flake8_ignore="E126,E127,E128"
" Run Flake8 after saving of python files
autocmd BufWritePost *.py call Flake8()
