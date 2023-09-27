#!/bin/bash

# Check if the session exists
tmux has-session -t dev 2>/dev/null

# $? is a special variable that holds the exit status of the last command executed
if [ $? != 0 ]; then
  # Create a new session with the first window named 'nvim'
  tmux new-session -s dev:1 -n nvim -d

  # Create the other windows
  tmux new-window -t dev:2 -n term
  tmux new-window -t dev:3 -n file
  tmux new-window -t dev:4 -n misc

  # Attach to the session
  tmux attach -t dev
else
  echo "Session 'dev' already exists. Attaching..."
  tmux attach -t dev
fi
