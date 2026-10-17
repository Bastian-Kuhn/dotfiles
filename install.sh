#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

DOTFILES=~/git/dotfiles
STAMP=$(date +%Y%m%d-%H%M%S)

# link <source> <target>
# Nothing is deleted: an existing target is moved to <target>.bak-<date> first.
# A target that already links to the source is left alone.
link() {
    local src=$1 target=$2
    if [ -L "$target" ] && [ "$(readlink "$target")" = "$src" ]; then
        echo "  ok      $target"
        return
    fi
    if [ -e "$target" ] || [ -L "$target" ]; then
        mv "$target" "$target.bak-$STAMP"
        echo "  backup  $target -> $target.bak-$STAMP"
    fi
    mkdir -p "$(dirname "$target")"
    ln -s "$src" "$target"
    echo "  linked  $target -> $src"
}


echo "Setup VIM"
link $DOTFILES/vim/vimrc ~/.vimrc
link $DOTFILES/vim/vim ~/.vim


echo "Setup TMUX"
link $DOTFILES/tmux/tmux.conf ~/.tmux.conf


echo "Link bin"
link $DOTFILES/bin ~/bin


echo "Setup ZSH"
link $DOTFILES/zsh/zshrc ~/.zshrc
link $DOTFILES/zsh/zprofile ~/.zprofile

echo "Setup p10k"
link $DOTFILES/zsh/p10k.zsh ~/.p10k.zsh

if [ "$machine" == "Linux" ]; then
    echo "Setup Awesome"
    link $DOTFILES/awesome ~/.config/awesome

    echo "Setup Terminator"
    link $DOTFILES/terminator ~/.config/terminator

fi
