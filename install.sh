#!/usr/bin/env bash
###
# 在用户主目录中创建 `~/dotfiles` 的 symlinks
# 1. 安装 Homebrew
# 1. 设置 Zsh
# 2. 设置 Vim
###

if [[ "$#" -ne 1 ]]; then
  echo "Usage: install.sh <home_directory>"
  exit 1
fi

home_dir=$1

dotfiles_dir=${home_dir}/dotfiles
# 需要在用户主目录中创建 symlinks 的文件
files=".zshrc .zprofile .zsh_prompt .zsh_aliases \
  .vimrc .gvimrc .ideavimrc \
  .editorconfig .gitconfig"

# 创建 symlinks（覆盖旧链接）
for file in ${files}; do
  echo "Creating symlink to $file in home directory."
  ln -sf "${dotfiles_dir}/${file}" "${home_dir}/${file}"
done

# pycodestyle
ln -sf "${dotfiles_dir}/settings/pycodestyle" "${home_dir}/.config/pycodestyle"

# 创建 `git_diff_wrapper` symlink 至 `$PATH`
echo "Creating symlink to git_diff_wrapper in /usr/local/bin directory."
ln -sf "${dotfiles_dir}/settings/git_diff_wrapper" /usr/local/bin/git_diff_wrapper

# 运行 Homebrew 脚本安装所需软件
./brew.sh
