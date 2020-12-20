" 调整 MacOS 终端光标样式：
"   1 -> 闪烁块状光标
"   2 -> 块状光标
"   3 -> 闪烁下划线光标
"   4 -> 下划线光标
"   5 -> 闪烁条形光标
"   6 -> 实心条形光标
let &t_VS.="\e[1 q" " 光标正常可见
let &t_SI.="\e[5 q" " 开始插入模式（SI = INSERT mode）
let &t_SR.="\e[3 q" " 开始替换模式（SR = REPLACE mode）
let &t_EI.="\e[1 q" " 结束插入或替换模式（EI = NORMAL mode (ELSE)）

" 使 MacVim 中的 yy、D、P 都可以和剪贴板一起工作
set clipboard=unnamed

" 开启语法高亮
syntax on

" 设置折叠方式为手工定义
set fdm=manual

" 关闭错误铃声
set belloff=all

"##
"# 快捷键设置
"##

" 映射 `,` 为 `<leader>`
let mapleader = ","

" 使用 `ctrl-h` `j` `k` `l` 来调整窗口
nnoremap <C-j>    :resize -2<CR>
nnoremap <C-k>    :resize +2<CR>
nnoremap <C-h>    :vertical resize -2<CR>
nnoremap <C-l>    :vertical resize +2<CR>

" 使用 `ctrl-c` 单词大小写切换
inoremap <C-c> <Esc>gUw
nnoremap <C-c> guw<Esc>

" 使用 `tab` 切换到下一个缓冲区文件
nnoremap <TAB> :bnext<CR>
" 使用 `shift-tab` 切换到上一个缓冲区文件
nnoremap <S-TAB> :bprevious<CR>

" 使用 `ctrl-\` 垂直分屏
nnoremap <C-\> :vsp<CR>
" 使用 `ctrl-_` 水平分屏
nnoremap <C-_> :sp<CR>

" 使用 `ctrl-s` 保存
nnoremap <C-s> :w<CR>
" 使用 `ctrl-q` 退出
nnoremap <C-q> :q<CR>

" 缩进时不丢失选区
vnoremap < <gv
vnoremap > >gv

" 使用 `<leader>` `h` `j` `k` `l` 窗口间导航
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" 显示行号
set nu " 绝对行号
set rnu " 相对行号

" 字符编码设置，自动保存为 UTF-8，打开 GBK 文件无需手动切换字符编码
set encoding=utf-8
let &termencoding=&encoding
set fileencodings=utf-8,gb18030,gbk,gb2312,big5

" 搜索高亮设置
set hlsearch " 高亮显示匹配
set incsearch " 实时查找预览

" 不与 vi 兼容（采用 vim 自己的操作命令）
set nocompatible

" 在一行中显示多个匹配项菜单
set wildmenu

" 在 vim 中搜索打开文件或文件夹时不区分大小写
set wildignorecase

" 取消自动折行
set nowrap

" 替换 `:set list` 显示的占位符
set listchars=tab:→\ ,eol:↲

"##
"# tab 与 空格
"##

" 自动缩进设置，将一个制表符自动转换两个空格
set sw=2 ts=2 sts=2 expandtab

" 查看文件类型：
"   - `:set filetype`
"   - `:set ft`
autocmd Filetype text setlocal sw=4 ts=4 sts=4 noexpandtab

" 垂直分屏打开新文件时，显示在当前窗口的右侧
set splitright

"##
"# 内置插件 - netrw
"##

" 关闭顶部 info banner，敲击 `I` 切换
let g:netrw_banner=0

" 不显示隐藏文件及文件夹，敲击 `gh` 切换
let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex

" 设置文件及文件夹以树形方式列出
let g:netrw_liststyle=3

" 设置新的文件管理器窗口大小，相对于当前缓存区窗口的整数值百分比
let g:netrw_winsize=25

" 设置在文件浏览窗口对文件敲击回车键，会在之前的窗口中打开该文件
let g:netrw_preview=1 " 设置文件预览窗口为垂直分屏窗口，敲击 `p`
let g:netrw_browse_split=4 " 行为类似 `p`，即打开之前的窗口

"##
"# Vim 插件
"##

" 插件管理器 vim-plug
"   - `:PlugInstall`：安装插件
"   - `:PlugUpdate`：安装或更新插件
"   - `:PlugClean[!]`：删除未列出的插件（bang 版本将不提示直接执行清除）
"   - `:PlugUpgrade`：升级 vim-plug 本身
"   - `:PlugStatus`：检查插件的状态

" 自动安装
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 指定插件存放目录
call plug#begin('~/.vim/plugged')

" 安装其他插件，确保使用单引号

" EditorConfig plugin for Vim
Plug 'editorconfig/editorconfig-vim'

" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 自动封口括号等
Plug 'jiangmiao/auto-pairs'

"##
"# 模糊搜索
"##

" `fzf` 命令工具
" `brew install fzf`
" `$(brew --prefix)/opt/fzf/install`

" 提供预览窗口的语法高亮
" `brew install bat`

" `:Rg` 需要 ripgrep (rg)
" `brew install ripgrep`

" `:Ag` 需要 The Silver Searcher (ag)
" `brew install the_silver_searcher`

" `:Tags` 和 `:Helptags` 需要 Perl
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" 自动将 vim 的工作目录切换到项目根目录
Plug 'airblade/vim-rooter'

" vim-material
Plug 'hzchirs/vim-material'

" 语法支持
Plug 'sheerun/vim-polyglot'

" 代码自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Markdown 实时预览
"   - `:InstantMarkdownPreview`：手动触发预览
"   - `:InstantMarkdownStop`：停止预览
" 需要全局安装 mini-server：`yarn global add instant-markdown-d`
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" 初始化插件系统
call plug#end()

" vim-airline theme
" light
" let g:airline_theme='light'

" vim-rooter 配置，识别为根目录的目录特征
let g:rooter_patterns = ['src', '.git', 'Makefile', 'package.json', 'pom.xml', 'venv', '*.sh', '*.md']

"##
"# fzf 配置
"##

" 忽略 `.gitignore` 中指定的文件
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" 使用 `<leader>f` 在当前目录及子目录中搜索文件内容
nnoremap <leader>f :Rg<CR>
" 使用 `<leader>e` 在当前文件中搜索文件内容
nnoremap <leader>e :BLines<CR>
" 使用 `shift-e` 在缓冲区中搜索文件内容
nnoremap <S-e> :Lines<CR>

" 使用 `<leader>o` 在当前目录及子目录搜索文件名
nnoremap <leader>o :Files<CR>
" 使用 `ctrl-e` 在缓冲区中搜索文件名
nnoremap <C-e> :Buffers<CR>

" 使用 `<leader>c` 搜索历史命令
nnoremap <leader>c :History:<CR>

"##
"# COC 配置
"##

" 自动安装缺少的扩展
let g:coc_global_extensions = ['coc-marketplace', 'coc-markdownlint', 'coc-json', 'coc-emmet', 'coc-html', 'coc-css', 'coc-tsserver']

" 如果没有设置隐藏，TextEdit 可能会失败
set hidden

" 有些服务器备份文件有问题
set nobackup
set nowritebackup

" 为显示消息提供更多的空间
set cmdheight=2

" 过长的 updatetime （默认是 4000 ms = 4 s）会导致明显的结果延迟和糟糕的用户体验
set updatetime=300

" 不要将消息传递给 |ins-completion-menu|
set shortmess+=c

" 始终显示 signcolumn，否则他将在每次诊断出现或解决后移动文本
if has("patch-8.1.1564")
  " 新版的 vim 会合并 signcolumn 和 number column 为一行
  set signcolumn=number
else
  set signcolumn=yes
endif

" 使用 `tab` 触发补全和导航
" NOTE: 使用 `:verbose imap <tab>` 确保 `tab` 未被其他插件使用
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 使用 `cr` 自动选择第一个补全项，并通知 `coc.nvim` 在回车时格式化
" `cr` 可以被其他 vim 插件重新映射
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 使用 `[g` 和 `]g` 导航诊断
" 使用 `:CocDiagnostics` 获取当前缓冲区中的所有诊断
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 代码导航
" 使用 `gd` 进入定义
nmap <silent> gd <Plug>(coc-definition)
" 使用 `gy` 进入类型定义
nmap <silent> gy <Plug>(coc-type-definition)
" 使用 `gi` 进入实现
nmap <silent> gi <Plug>(coc-implementation)
" 使用 `gr` 进入引用
nmap <silent> gr <Plug>(coc-references)

" 使用 `shift-k` 在预览窗口中显示代码文档
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" 在保持光标时突出显示符号及其引用
autocmd CursorHold * silent call CocActionAsync('highlight')

" 使用 `<leader>rn` 进行符号重命名
nmap <leader>rn <Plug>(coc-rename)

" 使用 `<leader>=` 格式化选中的代码
xmap <leader>=  <Plug>(coc-format-selected)
nmap <leader>=  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " 设置 formatexpr 指定的文件类型
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " 更新跳转占位符上的签名帮助
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" 使用 `<leader>a` 对选定区域应用 codeAction
" Example: `<leader>aap` 用于当前段落
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" 使用 `<leader>ac` 为当前缓存区应用 codeAction
nmap <leader>ac  <Plug>(coc-codeaction)
" 使用 `<leader>af` 为当前行上的问题应用 AutoFix
nmap <leader>qf  <Plug>(coc-fix-current)

" 映射函数和类文本对象
" NOTE: 需要语言服务器支持 'textDocument.documentSymbol'
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" 为能滚动浮动窗口或弹出窗口而重新映射 `ctrl-f` 和 `ctr-b`
" NOTE: `coc#float#scroll` 需要 neovim >= 0.4.0 或 vim >= 8.2.0750 才能工作
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" 为格式化当前缓冲区设置 `:Format` 命令
command! -nargs=0 Format :call CocAction('format')

" 为折叠当前缓冲区设置 `:Fold` 命令
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" 为组织当前缓冲区的 imports 设置 `:OR` 命令
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" 添加对 (Neo)Vim 的原生状态行支持
" NOTE: 通过 `:h coc-status`，可查看如何集成并自定义外部插件（lightline.vim、vim-airline）状态行的相关内容
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" 为 `:CoCList` 映射快捷键
" 使用 `<space>a` 显示所有诊断信息
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" 使用 `<space>e` 管理扩展
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" 使用 `<space>c` 显示命令
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" 使用 `<space>o` 查找当前文档的符号
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" 使用 `<space>s` 搜索工作区的符号
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" 使用 `<space>j` 对下一项执行默认操作
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" 使用 `<space>k` 对前一项执行默认操作
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" 使用 `<space>p` 再次执行最近的 CoCList 命令
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"##
"# vim-instant-markdown 配置
"##

" 选择自定义端口，而不是默认端口 8090
let g:instant_markdown_port = 8888
