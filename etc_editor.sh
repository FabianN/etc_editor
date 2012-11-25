#!/bin/bash

#####
#
# Editor wrap that will leave a diff stat for files you edit.
#
#####


##
# Config Start
##

EDITOR=vim

##
# Config End
##

## Setup variables
i=1
n=0
declare -a difffiles

directory=${1%/*}
file=${1##*/}

mkdir /tmp/etc_keeper
cp $1 /tmp/etc_keeper/$file

$EDITOR $1

until [[ $i == 0 ]]; do
    diffname="${1}.diff$[n+1]"
    if [ -e $diffname ]; then
        difffiles[$n]=$diffname # Build the array
        n=$[$n+1]
    else
        difffiles[$n]=$diffname # This will be the new diff file
        i=0
    fi
done

diff -u /tmp/etc_keeper/$file $1 > "${difffiles[-1]}"

##
# Cleanup files
##
rm -r /tmp/etc_keeper
