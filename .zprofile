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
# 设置环境变量
##

# 中科大源 - Homebrew 预编译二进制软件包
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

# 终端代理
export https_proxy=http://127.0.0.1:7890
export http_proxy=http://127.0.0.1:7890
export all_proxy=socks5://127.0.0.1:7890

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
