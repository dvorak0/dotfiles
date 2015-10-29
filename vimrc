set nocompatible
filetype plugin indent on
syntax on

set nu
set backupdir=~/.vim/vbackup/
set directory=~/.vim/vswap/
set undodir=~/.vim/vundo/
set viminfo='100,n~/.vim/vinfo/viminfo
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

set t_Co=256

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

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd BufRead,BufNewFile *.launch setfiletype xml

map <F6> :call CompileRunGpp()<cr>
func! CompileRunGpp()
    exec "!catkin_make"
endfunc

nmap dv df_
nmap cv cf_

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'wombat256.vim'

Plugin 'godlygeek/tabular'

Plugin 'a.vim'

Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_confirm_extra_conf=0

Plugin 'Chiel92/vim-autoformat'
let g:formatdef_clangformat="'clang-format-3.6 -lines='.a:firstline.':'.a:lastline.' --assume-filename='.bufname('%').' -style=\"{BasedOnStyle: LLVM, ColumnLimit: 0, BreakBeforeBraces: Allman, '.(&textwidth ? 'ColumnLimit: '.&textwidth.', ' : '').(&expandtab ? 'UseTab: Never, IndentWidth: '.&shiftwidth : 'UseTab: Always').'}\"'"
map ff :Autoformat<CR>


Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = ','
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/build/*,*/tmp/*,*.so,*.swp,*.zip,*.o
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

Plugin 'rhysd/accelerated-jk'
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

Plugin 'yonchu/accelerated-smooth-scroll'

"Plugin 'mhinz/vim-startify'

Plugin 'raymond-w-ko/vim-lua-indent'


call vundle#end()
filetype plugin indent on
colorscheme wombat256mod
