set nocompatible
filetype off

"Vundle
set rtp+=~/.vim/bundle/Vundle.vim

"Vundle 初始化
call vundle#begin()

"第一个
Plugin 'gmarik/Vundle.vim'

"git in vim
Plugin 'tpope/vim-fugitive'

"L9
Plugin 'L9'

"文件类型侦测
filetype plugin indent on

"补全神器 YouCompleteMe
Bundle 'Valloric/YouCompleteMe'

"markdown 插件
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

"状态栏增强
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"中英文排版
Bundle 'hotoo/pangu.vim'

"路径搜索
Plugin 'kien/ctrlp.vim'

"树形目录
Plugin 'scrooloose/nerdtree'

"代码总览
Plugin 'majutsushi/tagbar'

"语法检查
Plugin 'vim-syntastic/syntastic'

"结束
call vundle#end()

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
