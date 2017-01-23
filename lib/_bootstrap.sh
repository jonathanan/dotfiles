#!/usr/bin/env bash

# Message format
function message () {
  printf ">> $1\n"
}

# The destination path of a dotfile
function dot_path () {
    echo "$HOME/.$1"
}

# The destination path of a local dotfile
function local_path () {
    echo "$HOME/.$1.local"
}

# Links the passed item to its new location
function link () {
    local item=$1
    local path=$(dot_path $(basename $item))
    # Check if item to link exists
    if [[ ! -e $item ]]; then
        message "$item doesn't exist"
        return
    fi

    # Move existing file
    if [[ -f $path ]] && [[ ! -L $path ]]; then
        local localpath=$(local_path $item)
        mv $path $localpath
        message "Moved: $path to $localpath"
    fi

    # Create link
    if [[ -L $path ]]; then
        message "Ok: $path"
    elif [[ ! -e $path ]]; then
        message "Linking: $item to $path"
        ln -s $PWD/$item $path
    fi
}
