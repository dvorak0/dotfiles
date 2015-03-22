syntax on                      " 语法高亮
set nocompatible               " 禁用 vi 兼容模式
set nu                         " 显示行号
set ruler                      " 会在状态栏中显示光标当前所在行及列
set nobackup                   " 禁止 vim 自动生成当前编辑文件的备份文件, 就是我们经常看到的以~结尾的文件
set fdm=marker                 " 设置 vim 折叠方式
set bs=2                       " 这个选项可以解决 backspace 失效的问题
set backspace=indent,eol,start " 使得 backspace 能删除任何符号
set diffopt+=iwhite            " vimdiff 时忽略空格改变

set tabstop=2                  " 一个Tab字符占2个空格的位置
set shiftwidth=2               " 每层缩进的空格数
set expandtab                  " 将输入的Tab自动展开成空格，使用Python的同学必设配置
set softtabstop=2              " 当开启了 expandtab 时，每次退格删除两个空格，避免针对Tab还要多次输入退格键
set autoindent                 " 自动缩进，即为新行自动添加与当前行同等的缩进
set cindent                    " 开启类似C程序的缩进

filetype plugin indent on      " 打开文件类型检测

set incsearch                  " 增量查找
set smartcase                  " 智能匹配搜索结果
set hlsearch                   " 高亮搜索结果
set cursorline                 " 高亮当前行

set laststatus=2               " 永远显示状态栏
" 设置状态栏显示格式，可参见上图。左侧显示文件路径，右侧显示文件类型、编码、及当前光标所在行列
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %l:%c\ \(%p%%\)%)

" imap <c-c> <ESC>               " 编辑模式下，ctrl-c 可当 ESC 使用
" imap jj <ESC>                  " 编辑模式下，jj 可当 ESC 使用，可以避免左手摆动较大幅度去按 ESC 键，提高编辑速度
map <C-k> <C-w><Up>            " ctrl-k 切换到上边窗口
map <C-j> <C-w><Down>          " ctrl-j 切换到下边窗口
map <C-l> <C-w><Right>         " ctrl-l 切换到右边窗口
map <C-h> <C-w><Left>          " ctrl-h 切换到左边窗口

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

let mapleader=","
" My Bundles here:
Bundle 'wombat256.vim'
set t_Co=256
colorscheme wombat256mod


Bundle 'ctrlp.vim'
map <leader>f :CtrlP<cr>

Bundle 'neocomplcache'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

Bundle 'Syntastic'

Bundle 'snipMate'
autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby

Bundle 'Tabular'
