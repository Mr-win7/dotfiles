set nocompatible
set encoding=UTF-8
filetype off


"Plug 初始化
call plug#begin(expand('~/.vim/plugged'))

"git in vim
Plug 'tpope/vim-fugitive'

"文件类型侦测
filetype plugin indent on

"补全神器 YouCompleteMe
"Plug 'Valloric/YouCompleteMe', {'do':'./install.py --all'}
"Plug 'zxqfl/tabnine-vim'

"定义跳转ctags
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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
"Plug 'dense-analysis/ale'

"图标
Plug 'ryanoasis/vim-devicons'

"字体符号
Plug 'ryanoasis/vim-devicons'

"调试界面
Plug 'puremourning/vimspector'

"修改字符串
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

"结束
call plug#end()

"256色
set t_Co=256

"缓冲区切换改为tab
set switchbuf=usetab,newtab

"TAB转空格
set tabstop=2
set softtabstop=2
set shiftwidth=2
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

set notimeout

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

"let g:ale_completion_enabled = 1
"
"let g:ale_sign_column_always = 1
"let g:ale_linters_explicit = 0
"let g:ale_completion_delay = 500
"let g:ale_echo_delay = 20
"let g:ale_lint_delay = 500
"let g:ale_sign_error = '✗'
"let g:ale_sign_warning = '⚠'
"let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"let g:ale_echo_msg_format = '[%linter%] %code: %%s'
"let g:ale_lint_on_text_changed = 'always'
"let g:ale_lint_on_insert_leave = 1
"let g:airline#extensions#ale#enabled = 1
"let g:airline#extensions#ale#error_symbol = '✗'
"let g:airline#extensions#ale#warning_symbol = '⚠'
"
"let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
"let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
"let g:ale_c_cppcheck_options = ''
"let g:ale_cpp_cppcheck_options = ''
"
"let g:ale_cpp_ccls_init_options = {
"\   'cache': {
"\       'directory': '/home/wenkiwqwu/.cache/${project_root}/.cquery_cache'
"\   }
"\ }
"
"let g:ale_fixers = {
"\   'go' : ['gofmt'],
"\   'python' : ['autopep8'],
"\   'cpp' : ['clang-format'],
"\}

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
let $GTAGSCONF = expand('~/.local/share/gtags/gtags.conf')

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

"let g:LanguageClient_loadSettings = 1
"let g:LanguageClient_diagnosticsEnable = 0
"let g:LanguageClient_settingsPath = expand('~/.vim/languageclient.json')
""let g:LanguageClient_selectionUI = 'quickfix'
"let g:LanguageClient_dignosticsList = 'Quickfix'
""let g:LanguageClient_hoverPreview = 'Never'
"let g:LanguageClient_serverCommands = {}
"let g:LanguageClient_serverCommands.c = ['ccls']
"let g:LanguageClient_serverCommands.cpp = ['ccls']
"", '--init={:"cacheDirectory":"/home/wenkiwqwu/.cache/${project_root}/.cquery_cache"}'
"let g:LanguageClient_serverCommands.go = ['gopls']
"
"noremap <leader>rd :call LanguageClient#textDocument_definition()<CR>
"noremap <leader>rr :call LanguageClient#textDocument_rename()<CR>
"noremap <leader>rf :call LanguageClient#textDocument_formatting()<CR>
"noremap <leader>rt :call LanguageClient#textDocument_typeDefinition()<CR>
"noremap <leader>rx :call LanguageClient#textDocument_references()<CR>
"noremap <leader>ra :call LanguageClient_workspace_applyEdit()<CR>
"noremap <leader>rc :call LanguageClient#textDocument_completion()<CR>
"noremap <leader>rh :call LanguageClient#textDocument_hover()<CR>
"noremap <leader>rs :call LanguageClient_textDocument_documentSymbol()<CR>
"noremap <leader>rm :call LanguageClient_contextMenu()<CR>

augroup filetype
    autocmd! BufRead,BufNewFile BUILD set filetype=blade
augroup end

noremap <leader>ca :cs find a <C-R>=expand("<cword>")<CR><CR>
noremap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
noremap <leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>
noremap <leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
noremap <leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
noremap <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
noremap <leader>ci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
noremap <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
noremap <leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>

set notimeout

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

let g:vimspector_enable_mappings='HUMAN'

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

set updatetime=300
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')
