#!/bin/env bash

# This script sould be run from the working tree of the repo.

notpackages="LICENSE README.md applyconfig.sh"

function AnotinB {
    for element in $2; do
        if [[ $element = $1 ]]; then
              return 1
        fi
    done
    return 0
}

if [[ ! -e $HOME/.config ]]; then
    mkdir $HOME/.config
fi

# Special instructions for vim
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir $HOME/.vim/undodir

for package in $(echo *)
do
    if AnotinB $package "$notpackages"
    then
        stow --target=$HOME $package
    fi
done

