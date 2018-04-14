#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# shellcheck source=scripts/options.sh
source "${CURRENT_DIR}/scripts/options.sh"


select_buffer_bindings() {
    local script="${CURRENT_DIR}/scripts/select_buffer.sh"
    tmux bind-key "$(key_option)" run-shell "${script} '$(command_option)'"
}


main() {
    select_buffer_bindings
}

main
