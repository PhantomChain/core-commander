#!/usr/bin/env bash

core_configure_log_level ()
{
    ascii

    local envFile="${CORE_DATA}/.env"

    . "$envFile"

    info "Which log level would you like to configure?"

    local validLevels=("debug" "info" "warning" "error")

    local inputLevel=$PHANTOM_LOG_LEVEL

    select opt in "${validLevels[@]}"; do
        case "$opt" in
            "debug")
                inputLevel=debug
                break
            ;;
            "info")
                inputLevel=info
                break
            ;;
            "warning")
                inputLevel=warning
                break
            ;;
            "error")
                inputLevel=error
                break
            ;;
            *)
                echo "Invalid option $REPLY"
            ;;
        esac
    done

    if [[ "$PHANTOM_LOG_LEVEL" != "$inputLevel" ]]; then
        sed -i -e "s/PHANTOM_LOG_LEVEL=$PHANTOM_LOG_LEVEL/PHANTOM_LOG_LEVEL=$inputLevel/g" "$envFile"
    fi

    . "$envFile"
}
