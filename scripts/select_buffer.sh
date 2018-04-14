#!/usr/bin/env bash

# Paste selected tmux buffer

buffer=$(tmux list-buffers | fzf-tmux --exit-0 | cut -d: -f1)
if [[ $buffer ]]; then
    tmux paste-buffer -b "$buffer"
fi
