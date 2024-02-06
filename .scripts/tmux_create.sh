#!/bin/sh

if [ $1 ]; then
  tmux new -s $@
  exit 0
fi

tmux new-session

