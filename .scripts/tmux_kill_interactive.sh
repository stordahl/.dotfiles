#!/bin/bash

# Function to kill tmux sessions interactively
kill_tmux_sessions() {
    # Check if tmux is running
    #if ! tmux info &> /dev/null; then
        #echo "No tmux sessions found."
        #exit 1
    #fi

    # Select sessions to kill using fzf (multi-select enabled)
    selected_sessions=$(tmux ls 2>/dev/null | fzf \
        --height 40% \
        --reverse \
        --border rounded \
        --prompt 'Select tmux sessions to kill > ' \
        --multi \
        --preview 'echo {}' \
        --preview-window up:3:wrap \
        | sed 's/:.*//')

    # Exit if no sessions were selected
    if [ -z "$selected_sessions" ]; then
        echo "No sessions selected. Exiting."
        exit 0
    fi

    # Confirm before killing
    echo "The following sessions will be killed:"
    echo "$selected_sessions"
    read -p "Are you sure? (y/N) " confirm

    # Kill selected sessions if confirmed
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
        while IFS= read -r session; do
            tmux kill-session -t "$session"
            echo "Killed session: $session"
        done <<< "$selected_sessions"
    else
        echo "Operation cancelled."
    fi
}

# Run the function
kill_tmux_sessions
