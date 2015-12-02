call plug#begin()

Plug 'vim-scripts/wombat256.vim'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'godlygeek/tabular'

Plug 'vim-scripts/a.vim'

Plug 'Valloric/YouCompleteMe' , { 'do': './install.py --clang-completer' }
let g:ycm_confirm_extra_conf=0

Plug 'Chiel92/vim-autoformat'
let g:formatdef_clangformat = '"clang-format-3.6 -style=file"'
map ff :Autoformat<CR>


Plug 'kien/ctrlp.vim'
let g:ctrlp_map = ','
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/build/*,*/tmp/*,*.so,*.swp,*.zip,*.o
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

Plug 'rhysd/accelerated-jk'
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

Plug 'yonchu/accelerated-smooth-scroll'

"Plug 'mhinz/vim-startify'

Plug 'raymond-w-ko/vim-lua-indent'

call plug#end()


set nocompatible
filetype plugin indent on
syntax on

colorscheme wombat256mod
set t_Co=256

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


