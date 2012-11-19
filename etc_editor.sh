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


directory=${1%/*}
file=${1##*/}

mkdir /tmp/etc_keeper
cp $1 /tmp/etc_keeper/$file

$EDITOR $1
