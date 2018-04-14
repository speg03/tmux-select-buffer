#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


get_tmux_option() {
    local option_name="$1"
    local default_option_value="$2"
    local option_value

    option_value=$(tmux show-option -gqv "$option_name")
    if [[ $option_value ]]; then
        echo "$option_value"
    else
        echo "$default_option_value"
    fi
}


select_buffer_bindings() {
    local key
    local script

    key=$(get_tmux_option "@select-buffer-key" "=")
    script="$CURRENT_DIR/scripts/select_buffer.sh"
    tmux bind-key "$key" run-shell "$script"
}


main() {
    select_buffer_bindings
}

main
