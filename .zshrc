#!/usr/bin/env zsh
###
# If the shell is a login shell,
# commands are read from `/etc/zprofile` and then `$ZDOTDIR/.zprofile`.
# Then, if the shell is interactive,
# commands are read from `/etc/zshrc` and then `$ZDOTDIR/.zshrc`.
###

##
# 加载 dotfiles
##
for file in ~/.{zsh_prompt,zsh_aliases}; do
  # shellcheck disable=SC1090
  [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file
