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

if [[ ! -e $HOME/.themes ]]; then
    mkdir $HOME/.themes
fi

# Special instructions for vim
if [[ ! -e $HOME/.vim/autoload/plug.vim ]]; then
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
if [[ ! -e $HOME/.vim/undodir ]]; then
    mkdir $HOME/.vim/undodir
fi

if [[ -z $XDG_CONFIG_HOME ]]; then
    echo "You must configure the XDG directories !!!"
    exit 1
fi

for package in $(echo *)
do
    if AnotinB $package "$notpackages"
    then
        echo "Stowing package $package"
        stow --target=$HOME $package
    fi
done

