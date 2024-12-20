#!/bin/sh

# Interactive git branch switcher
# If branch name is provided as argument, switches directly
# Otherwise opens fuzzy finder to select from 25 most recent branches

if [ "$1" ]; then
    git switch "$@"
    exit 0
fi

# Get branch selection via fuzzy finder
branch_selection=$(git for-each-ref \
    --sort=-committerdate \
    --format='%(refname:short)' \
    --count=25 \
    refs/heads/ \
    | fzf \
        --height 40% \
        --reverse \
        --border rounded \
        --prompt 'Switch to branch > ' \
        --preview 'git log -1 --color=always {}' \
        --preview-window up:3:wrap)

# Exit if no branch was selected
if [[ -z "$branch_selection" ]]; then
    exit 0
fi

# Switch to selected branch
git switch "$branch_selection"

