#!/bin/sh

if [ $1 ]; then
  git switch $@
  exit 0
fi

selected=`git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)' --count=25 | fzf`

if [[ -z $selected ]]; then
    exit 0
fi

git switch $selected

