#!/bin/sh

if [ -n "$TMUX" ]; then
  echo "Already attached to session"
  exit 1
fi

# If session name is provided as argument, attach directly
if [ -n "$1" ]; then
    tmux attach -t "$@"
    exit 0
fi

# List tmux sessions and let user select interactively
selected=$(tmux ls 2>/dev/null | fzf \
    --height 40% \
    --reverse \
    --border rounded \
    --prompt 'Select tmux session > ' \
    --preview 'echo {}' \
    --preview-window up:3:wrap \
    | sed 's/:.*//')

# Exit if no session was selected
if [ -z "$selected" ]; then
    exit 0
fi

# Attach to the selected session
tmux attach -t "$selected"

