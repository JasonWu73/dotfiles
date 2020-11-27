#!/usr/bin/env zsh

# 如果不是交互式运行，不要做任何事情
[[ $- == *i* ]] || return

# shellcheck disable=SC1090
[ -n "$PS1" ] && source ~/.zprofile
