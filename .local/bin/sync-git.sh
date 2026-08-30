#!/usr/bin/env bash

# Define git dir - maybe create as a param as an extendable script
DOTFILES_DIR="$HOME/dotfiles"

cd "$DOTFILES_DIR" || exit 1

# Check if there are any uncommitted changes
if [[ -n $(git status -s) ]]; then
    git add .
    git commit -m "chore(auto): sync dotfiles $(date +'%Y-%m-%d %H:%M')"
    
    # We redirect output to systemd's journal - ?
    git push origin main 2>&1
else
    echo "No changes to sync."
fi
