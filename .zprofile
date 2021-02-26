#!/usr/bin/env zsh
###
# If the shell is a login shell,
# commands are read from `/etc/zprofile` and then `$ZDOTDIR/.zprofile`.
# Then, if the shell is interactive,
# commands are read from `/etc/zshrc` and then `$ZDOTDIR/.zshrc`.
###

##
# 使用 Zsh 插件
##

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

##
# 模糊搜索命令行工具
##

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

# fzf color schemes (Alternate Solarized Light/Dark Theme)
_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  # Comment and uncomment below for the light theme.

  # Solarized Dark color scheme for fzf
  #export FZF_DEFAULT_OPTS="
  #  --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
  #  --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  #  --layout=reverse --inline-info
  #"
  # Solarized Light color scheme for fzf
  export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
    --layout=reverse --inline-info
  "
}
_gen_fzf_default_opts

# 执行 `$(brew --prefix)/opt/fzf/install` 时自动生成的代码
# 该行需要放置在后续 fzf 配置之前
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

##
# 设置环境变量
##

# 中科大源 - Homebrew 预编译二进制软件包
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

# Switch between different JDK versions
jdk() {
  version=$1
  # shellcheck disable=SC2155
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version")
  # java -version
}
#jdk 1.8
jdk 11

PATH="${JAVA_HOME}/bin:/usr/local/apache-maven/bin:${PATH}"
export PATH
