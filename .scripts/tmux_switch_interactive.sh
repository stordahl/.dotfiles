#!/bin/sh

if [ $1 ]; then
  tmux attach -t $@
  exit 0
fi

selected=`tmux ls | fzf | sed 's/:.*//'`

if [[ -z $selected ]]; then
    exit 0
fi

tmux attach -t $selected

