set nomodeline
set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
" Sntax for dockerfiles
Plugin 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}
" Syntax for terraform
Plugin 'hashivim/vim-terraform'
" Syntax for kotlin
Plugin 'zxqfl/tabnine-vim'
Plugin 'morhetz/gruvbox'
Plugin 'airblade/vim-rooter'
call vundle#end()            " required

syntax on
filetype plugin indent on
colorscheme gruvbox
set background=dark
hi Normal guibg=NONE ctermbg=NONE
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set expandtab
set number
set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch
set hlsearch
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
set rtp+=~/.fzf

let mapleader=","
" execute current file with ansible-playbook
nmap <leader>aaa :w !ansible-playbook %:p<CR>
" execute current buffer with ansible-playbook
nmap <leader>aa :w !ansible-playbook /dev/stdin<CR>
" Same but don't automatically run the command
nmap <leader>a :w !ansible-playbook /dev/stdin

" Execute current file with python
nnoremap <leader>ppp :w !python %:p<CR>
" Execute current buffer with python
nnoremap <leader>pp :w !python /dev/stdin<CR>
" Same but don't automatically run the command
nnoremap <leader>p :w !python /dev/stdin

" tox -e linters
nnoremap <leader>l :!tox -e linters<CR>
" Run flake8
nnoremap <leader>f :w !flake8 /dev/stdin<CR>

" Open new temporary yaml file
function! MkTemp(filetype)
  execute 'tabedit +setf\' a:filetype
endfunction
nnoremap <leader>ty :call MkTemp("yaml")<CR>

nnoremap <leader><space> :nohlsearch<CR>
nmap <C-p> :FZF<CR>
nmap <C-e> :Rg<CR>

" yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
