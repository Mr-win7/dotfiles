set nocompatible
set encoding=UTF-8
filetype off


"Plug 初始化
call plug#begin('~/.vim/plugged')

"git in vim
Plug 'tpope/vim-fugitive'

"文件类型侦测
filetype plugin indent on

"补全神器 YouCompleteMe
"Plug 'Valloric/YouCompleteMe', {'do':'./install.py --all'}
Plug 'zxqfl/tabnine-vim'

"定义跳转ctags
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

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
Plug 'dense-analysis/ale'

"图标
Plug 'ryanoasis/vim-devicons'

"结束
call plug#end()

"256色
set t_Co=256


"TAB转空格
set tabstop=4
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

"关闭ycm诊断
let g:ycm_show_diagnostics_ui = 0


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

let g:ale_completion_enabled = 1

let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 0
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = '✗'
let g:airline#extensions#ale#warning_symbol = '⚠'

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_fixers = {
\   'go' : ['gofmt'],
\   'python' : ['autopep8'],
\   'cpp' : ['clang-format'],
\}

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_enable_signs = 1
"
""退出并写入时不检查
"let g:syntastic_check_on_wq = 0
"
""JavaScript 语法分析器选择
"let g:syntastic_javascript_checkers = ['eslint']
"
""Java 语法分析器选择（避免与 YouCompleteMe 冲突）
"let g:syntastic_java_checkers = []
"
"状态栏配置
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts = 1


"gutentags配置

"let $GTAGSLABEL = 'native-pygments'
let $GTAGSLABEL='native'
let $GTAGSCONF = '/data/home/wenkiwqwu/.local/share/gtags/gtags.conf'

"ctags查找路径
set tags=./.tags;,.tags

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"控制universal ctags
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

let g:gutentags_file_list_command = 'find . -type f -name *.cc -o -type f -name *.h'

let g:LanguageClient_loadSettings = 1
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_settingsPath = expand('~/.vim/languageclient.json')
"let g:LanguageClient_selectionUI = 'quickfix'
let g:LanguageClient_diagnosticsList = v:null
"let g:LanguageClient_hoverPreview = 'Never'
let g:LanguageClient_serverCommands = {}
let g:LanguageClient_serverCommands.c = ['cquery']
let g:LanguageClient_serverCommands.cpp = ['cquery']

noremap <leader>rd :call LanguageClient#textDocument_definition()<cr>
noremap <leader>rr :call LanguageClient#textDocument_references()<cr>
noremap <leader>rv :call LanguageClient#textDocument_hover()<cr>

augroup filetype
    autocmd! BufRead,BufNewFile BUILD set filetype=blade
augroup end
