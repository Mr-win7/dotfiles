set nocompatible
filetype off

"Vundle
set rtp+=~/.vim/bundle/Vundle.vim

"Vundle初始化
call vundle#begin()

"第一个
Plugin 'gmarik/Vundle.vim'

"git in vim
Plugin 'tpope/vim-fugitive'

"L9
Plugin 'L9'

"文件类型侦测
filetype plugin indent on

"补全神器
Bundle 'Valloric/YouCompleteMe'

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
