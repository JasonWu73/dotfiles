#!/usr/bin/env zsh

# 加载 dotfiles
for file in ~/.{zsh_prompt,zsh_aliases}; do
    # shellcheck disable=SC1090
    [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file


# 使用 Zsh 插件

# 命令行命令自动补全插件
# `git clone https://github.com/zsh-users/zsh-autosuggestions`
if [[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  # shellcheck disable=SC1090
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# 命令行命令语法高亮插件
# `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git`
if [[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  # shellcheck disable=SC1090
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


# 模糊搜索

# fzf
# `brew install fzf`
# 安装有用的快捷键绑定和模糊补全
# `$(brew --prefix)/opt/fzf/install`

# 替代 `find` 命令的工具 `fd`
# `brew install fd`

# 使用正则模式的目录递归搜索工具 `rg`，遵循 `.gitignore`
# `brew install ripgrep`

# 代码搜索工具 `ag`，遵循 `.gitignore`
# `brew install the_silver_searcher`

# 语法高亮工具 `bat`
# `brew install bat`

# Universal Ctags
# `brew install --HEAD universal-ctags/universal-ctags/universal-ctags`

# 自动生成的代码
# shellcheck disable=SC1090
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# 配置在 MacOS 中使用 `option-c` 替换为默认的 `alt-c`
bindkey "¸" fzf-cd-widget

# 覆盖终端下 `fzf` 默认命令
# 设置 `fd` 为 `fzf` 的默认源
# 命令跟随符号链接，不排除隐藏文件，遵循 `.gitignore`
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# 将替换后的 `fzf` 默认命令应用到 `ctrl-t`
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# 为 `fzf` 配置默认选项
# 带有语法高亮（Bat）的文件内容预览窗口
export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'


# 设置环境变量

# 中科大源 - Homebrew 预编译二进制软件包
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:/usr/local/apache-maven/bin:${PATH}"
export PATH
