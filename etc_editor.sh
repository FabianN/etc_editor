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


until [[ $i==0 ]]; do
    diffname="$1.diff$[n+1]"
    echo "Test-filename of the diff is: $diffname"
    if [[ -e $difffile ]]; then
        difffiles[$n]=$diffname # Build the array
        echo "Test-added #$n"
        n=$[$n+1]
    else

    fi
done

##
# Cleanup files
##
rm -r /tmp/etc_keeper
