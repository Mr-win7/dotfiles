set nocompatible
filetype off


"Plug 初始化
call plug#begin('~/.vim/plugged')

"git in vim
Plug 'tpope/vim-fugitive'

"文件类型侦测
filetype plugin indent on

"补全神器 YouCompleteMe
Plug 'Valloric/YouCompleteMe', {'do':'./install.py --all'}

"定义跳转ctags
Plug 'ludovicchabant/vim-gutentags'

"markdown 插件
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

"状态栏增强
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"中英文排版
Plug 'hotoo/pangu.vim'

"路径搜索
Plug 'kien/ctrlp.vim'

"树形目录
Plug 'scrooloose/nerdtree'

"代码总览
Plug 'majutsushi/tagbar'

"语法检查
Plug 'vim-syntastic/syntastic'

"结束
call plug#end()

"TAB转空格
set softtabstop=4
set shiftwidth=4
set expandtab

"自动补全
set autoindent
set smarttab
set smartindent

"语法高亮
syntax on

"搜索高亮
set incsearch
set hlsearch

"行号
set nu

"普通模式取消输入法（目前 wsl 下好像无效）
set imdisable
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set noimdisable

"YouCompleteMe 配置

"语义触发字符
let g:ycm_semantic_triggers =  {
\   'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
\   'cs,lua,javascript': ['re!\w{2}'],
\}


"markdown 配置

"取消折叠
let g:vim_markdown_folding_disabled = 1

"排版配置

"文本文件写入时自动排版
autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

"树形目录配置

"自动打开目录
"autocmd vimenter * NERDTree

"语法检查配置

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1

"退出并写入时不检查
let g:syntastic_check_on_wq = 0

"JavaScript 语法分析器选择
let g:syntastic_javascript_checkers = ['eslint']

"Java 语法分析器选择（避免与 YouCompleteMe 冲突）
let g:syntastic_java_checkers = []

"状态栏配置
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts = 1
