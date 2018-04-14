#!/usr/bin/env bash

# Paste selected tmux buffer

select_buffer() {
    local select_command="$1"
    local select_command_base
    local buffer

    select_command_base=$(echo "$select_command" | cut -d' ' -f1)
    if type "$select_command_base" &>/dev/null; then
        buffer=$(tmux list-buffers | $select_command | cut -d: -f1)
        if [[ $buffer ]]; then
            tmux paste-buffer -b "$buffer"
        fi
    else
        tmux choose-buffer
    fi
}


main() {
    select_buffer "$@"
}

main "$@"
