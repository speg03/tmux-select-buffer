# -*- mode: sh; sh-shell: bash -*-

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


key_option() {
    get_tmux_option '@select-buffer-key' '='
}

command_option() {
    get_tmux_option '@select-buffer-command' 'fzf-tmux --exit-0'
}
