set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'rhysd/accelerated-jk'
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

Plugin 'yonchu/accelerated-smooth-scroll'

Plugin 'a.vim'

Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = ','
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/build/*,*/tmp/*,*.so,*.swp,*.zip,*.o
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


Plugin 'octol/vim-cpp-enhanced-highlight'

"Plugin 'wombat256.vim'
Plugin 'altercation/vim-colors-solarized'

Plugin 'godlygeek/tabular'
Plugin 'Chiel92/vim-autoformat'
let g:formatdef_clangformat = '"clang-format-3.6 -style=file"'
map ff :Autoformat<CR>

Plugin 'Valloric/YouCompleteMe'
let g:ycm_confirm_extra_conf=0

call vundle#end()
filetype plugin indent on
syntax enable
set background=dark
set t_Co=16
colorscheme solarized

set nu
set backupdir=~/.vim/vbackup/
set directory=~/.vim/vswap/
set undodir=~/.vim/vundo/
set viminfo='100,n~/.vim/vinfo/viminfo
set undofile
set undolevels=1000
set undoreload=10000

set expandtab
set tabstop=4
set shiftwidth=4

set laststatus=2

set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch

set splitbelow
set splitright

map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
set pastetoggle=<F5>

map <F6> :call CompileRunGpp()<cr>
func! CompileRunGpp()
    exec "!catkin_make"
endfunc

autocmd BufRead,BufNewFile *.launch setfiletype xml
