#!/usr/bin/env bash
################################################
# 在用户主目录中创建 `~/dotfiles` 的 symlinks  #
# 1. 安装 Homebrew                             #
# 1. 设置 Zsh                                  #
# 2. 设置 Vim                                  #
################################################

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

# 进入 dotfiles 目录
echo "Changing to the ${dotfiles_dir} directory"
cd "${dotfiles_dir}" || exit
echo "...done"

# 创建 symlinks（覆盖旧链接）
for file in ${files}; do
  echo "Creating symlink to $file in home directory."
  ln -sf "${dotfiles_dir}"/"${file}" "${home_dir}"/"${file}"
done

# 运行 Homebrew 脚本安装所需软件
./brew.sh
