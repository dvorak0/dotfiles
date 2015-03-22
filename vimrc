set nocompatible
filetype plugin indent on
syntax on

set nu
set backupdir=~/.vim/vbackup/
set directory=~/.vim/vswap/
set undodir=~/.vim/vundo/
set undofile
set undolevels=1000
set undoreload=10000

set pastetoggle=<F5>

set expandtab
set tabstop=4
set shiftwidth=4

set laststatus=2

set ignorecase
set smartcase
set hlsearch

set showmatch
set ignorecase
set smartcase
set incsearch

set splitbelow
set splitright

colorscheme wombat256mod

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

autocmd BufRead,BufNewFile *.launch setfiletype xml

map <F6> :call CompileRunGpp()<cr>
func! CompileRunGpp()
    exec "!catkin_make"
endfunc

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'godlygeek/tabular'

Plugin 'a.vim'

"Plugin 'Yggdroot/indentLine'

Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_confirm_extra_conf=0


Plugin 'Chiel92/vim-autoformat'
noremap <F3> :Autoformat<CR><CR>
"let g:formatprg_c = "astyle"
"let g:formatprg_args_c = "--pad-oper --unpad-paren -pcHs4"


Plugin 'kien/ctrlp.vim'

let g:ctrlp_map = ','
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/build/*,*/tmp/*,*.so,*.swp,*.zip,*.o
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


call vundle#end()
filetype plugin indent on
