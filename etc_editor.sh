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

echo "Test-i is ${i}, and n is ${n}" #Test Line

directory=${1%/*}
file=${1##*/}

echo "Test-dir is ${directory} and file is ${file}" #Test Line

mkdir /tmp/etc_keeper
cp $1 /tmp/etc_keeper/$file

$EDITOR $1

echo "Test-editor end"

until [[ $i == 0 ]]; do
    diffname="${1}.diff$[n+1]"
    echo "Test-looking for: $diffname" #Test Line
    if [ -e $diffname ]; then
        echo "Test-FOUND IT!" #Test Line
        difffiles[$n]=$diffname # Build the array
        echo "Test-added to array entry #$n." #Test Line
        n=$[$n+1]
    else
        echo "Test-DIDN'T FIND IT!" #Test Line
        difffiles[$n]=$diffname # This will be the new diff file
        echo "Test-End, added #$n" #Test Line
        i=0
    fi
done

echo "Test-create a file at ${difffiles[-1]}" #Test Line

##
# Cleanup files
##
rm -r /tmp/etc_keeper
