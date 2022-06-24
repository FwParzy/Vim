call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'sainnhe/gruvbox-material'
Plug 'preservim/nerdtree'
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-commentary'
call plug#end()

set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2

imap jk <Esc>
nnoremap ww :w<Return>
nnoremap qq :wq<Return>
nnoremap q1 :q<Return>
nnoremap ff :CocAction<Return>
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D
map <c-p> :Files<Return>
map <c-f> :Rg<Return>
map <c-n> :NERDTreeToggle<CR>
map <s-h> :bprev<Return>
map <s-l> :bnext<Return>
map <s-d> :bdel<Return>

" Set the UI to look how I prefer
colorscheme gruvbox-material
let g:gruvbox_material_sign_column_background = 'none'
let g:airline#extensions#tabline#enabled = 1

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set noautoindent	" always set autoindenting off
set nowrap		" always set line wrap off. This was ANNOYING!
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set nobackup		" keep a backup file
endif
set history=200		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
" Typescript has slow synax highlighting, this fixes it
set re=0

" set up tag files to scan.
:set tags=./tags,tags,/usr/local/src/MAIL/tags

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " autocmd for sqwebmail HTML templates "
  autocmd FileType html setlocal sw=2 ts=2 et

  " autocmd for PHP scripts "
  autocmd FileType php setlocal sw=2 ts=2 et

  autocmd FileType html.handlebars setlocal sw=2 ts=2 et

  autocmd FileType javascript.jsx setlocal sw=2 ts=2 et

  autocmd FileType css setlocal sw=2 ts=2 et

  " autocmd for dotNET scripts "
  autocmd FileType cs setlocal sw=2 ts=2 et

  " autocmd for Perl scripts "
  autocmd FileType perl setlocal sw=2 ts=2 et

  " autocmd for OCaml scripts "
  autocmd FileType ocaml setlocal sw=2 ts=2 et
  
  " autocmd for Python scripts "
  autocmd FileType python setlocal sw=2 ts=2 et

  " autocmd for Shell scripts "
  autocmd FileType sh setlocal sw=2 ts=2 et
  
  " autocmd for Ocaml dllist templates "
  autocmd BufNewFile,BufRead dllist.ml* setlocal sts=0 noexpandtab

  " autocmd for ASP.NET "
  autocmd FileType mason setlocal sw=2 ts=2 et
  
  " autocmd for SQL "
  autocmd FileType sql setlocal sw=2 ts=2 et

  autocmd FileType javascript setlocal sw=2 ts=2 et
  autocmd FileType json setlocal sw=2 ts=2 et

  " autocmd for Objective-C "
  autocmd FileType objc setlocal sw=4 ts=4 et

  " autocmd for Ruby "
  autocmd FileType ruby setlocal sw=2 ts=2 et

  " autocmd for Ruby "
  autocmd FileType eruby setlocal sw=2 ts=2 et

  " autocmd for Coffee "
  autocmd FileType coffee setlocal sw=2 ts=2 et

  " autocmd for jbuilder "
  au BufNewFile,BufRead *.json.jbuilder set ft=ruby

  " autocmd for TTD list "
  autocmd BufNewFile,BufRead *TTD.txt* set nobackup

  autocmd BufNewFile,BufRead *.mm set filetype=objc

  " autocmd for OpenSCAD list "
  autocmd BufNewFile,BufRead *.scad set filetype=openscad
  autocmd FileType openscad setlocal sw=2 ts=2 et

  " autocmd for Arduino "
  autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino sw=2 ts=2 et

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd BufNewFile,BufRead Gemfile set filetype=ruby

endif " has("autocmd")

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
  set clipboard=unnamed
endif

set nofoldenable
nnoremap <Leader>[ :tabprevious<CR>
nnoremap <Leader>] :tabnext<CR>
set laststatus=2

set wildmode=longest,list,full
set number

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
