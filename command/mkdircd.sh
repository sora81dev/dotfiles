#! /bin/zsh

# mkdircd
# --------------
# Description: This command can quickly create folder and quickly move created folder

mkdircd() {
    text="$1"
    mkdir $1
    cd $1
}
