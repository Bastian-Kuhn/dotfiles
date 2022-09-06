#!/bin/bash
GIT_PATH=./vim/vim/bundle/
echo "Clone Git Plugin"
cd $GIT_PATH
while read line; do
    git clone $line
done < gitsources
cd ~
rm .vimrc
rm -r .vim
ln -s ~/git/dotfiles/vim/vimrc .vimrc
ln -s ~/git/dotfiles/vim/vim .vim


echo "Setup TMUX"
cd ~
rm .tmux.conf
ln -s ~/git/dotfiles/tmux/tmux.conf .tmux.conf


echo "Link bin"
cd ~
rm -r ./bin
ln -s ./git/dotfiles/bin ./bin
