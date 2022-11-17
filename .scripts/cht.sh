#!/usr/bin/env bash
selected=`cat ~/.scripts/.cht-languages ~/.scripts/.cht-command | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.scripts/.cht-languages; then
    query=`echo $query | tr ' ' '+'`
    curl cht.sh/$selected/$query 
else
    curl -s cht.sh/$selected~$query
fi
