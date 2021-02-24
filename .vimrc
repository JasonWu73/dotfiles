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

" 自动折行，且保留完整单词
set wrap
set linebreak
set nolist

" 替换 `:set list` 显示的占位符
set listchars=tab:→\ ,eol:↲
set lcs+=space:·

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

Plug 'phanviet/vim-monokai-pro'

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

" 语法支持
Plug 'sheerun/vim-polyglot'

" 初始化插件系统
call plug#end()

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
