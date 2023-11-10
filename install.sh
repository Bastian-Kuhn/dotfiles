#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac


echo "Setup VIM"
rm ~/.vimrc
rm -r ~/.vim
ln -s ~/git/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/git/dotfiles/vim/vim ~/.vim


echo "Setup TMUX"
rm ~/.tmux.conf
ln -s ~/git/dotfiles/tmux/tmux.conf ~/.tmux.conf


echo "Link bin"
rm -r ~/bin
ln -s ~/git/dotfiles/bin ~/bin


echo "Setup ZSH"
rm ~/.zshrc
ln -s ~/git/dotfiles/zsh/zshrc ~/.zshrc

echo "Setup p10k"
rm ~/.p10k.zsh
ln -s ~/git/dotfiles/zsh/p10k.zsh ~/.p10k.zsh

if [ "$machine" == "Linux" ]; then
    echo "Setup Awesome"
    rm ~/.config/awesome
    ln -s ~/git/dotfiles/awesome ~/.config/awesome

    echo "Setup Terminator"
    rm -r ~/.config/terminator
    ln -s ~/git/dotfiles/terminator ~/.config/terminator

fi
