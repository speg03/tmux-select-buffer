#!/usr/bin/env bash

# Paste selected tmux buffer

select_buffer() {
    local select_command="$1"
    local buffer

    buffer=$(tmux list-buffers | $select_command | cut -d: -f1)
    if [[ $buffer ]]; then
        tmux paste-buffer -b "$buffer"
    fi
}


main() {
    select_buffer "$@"
}

main "$@"
