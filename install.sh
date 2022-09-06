#!/bin/bash
GIT_PATH=./vim/vim/bundle/
echo "Clone Git Plugin"
cd $GIT_PATH
while read line; do
    git clone $line
done < gitsources

