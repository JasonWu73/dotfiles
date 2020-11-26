#!/usr/bin/env zsh

# 如果不是交互式运行，不要做任何事情
[[ $- == *i* ]] || return

# shellcheck disable=SC1090
[ -n "$PS1" ] && source ~/.zprofile

# Switch between different JDK versions
jdk() {
  version=$1
  # shellcheck disable=SC2155
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version")
  # java -version
}
jdk 1.8
# jdk 9
# jdk 11
# jdk 13
