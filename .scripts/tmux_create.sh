#!/bin/sh
DIR_NAME=${PWD##*/}

if [ $1 ]; then
  tmux new -s $@
  exit 0
fi

tmux new -s $DIR_NAME

