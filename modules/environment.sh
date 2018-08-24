#!/usr/bin/env bash

setup_environment_file ()
{
    local envFile="${CORE_DATA}/.env"

    if [[ ! -e "${envFile}" ]]; then
        mkdir -p "${HOME}/.ark"
        touch "${envFile}"
    fi

    if ! grep -q "PHANTOM_LOG_LEVEL" "${envFile}"; then
        echo "PHANTOM_LOG_LEVEL=debug" >> "$envFile" 2>&1
    fi

    if ! grep -q "PHANTOM_DB_HOST" "${envFile}"; then
        echo "PHANTOM_DB_HOST=localhost" >> "$envFile" 2>&1
    fi

    if ! grep -q "PHANTOM_DB_PORT" "${envFile}"; then
        echo "PHANTOM_DB_PORT=5432" >> "$envFile" 2>&1
    fi

    if ! grep -q "PHANTOM_DB_USERNAME" "${envFile}"; then
        echo "PHANTOM_DB_USERNAME=${USER}" >> "$envFile" 2>&1
    fi

    if ! grep -q "PHANTOM_DB_PASSWORD" "${envFile}"; then
        echo "PHANTOM_DB_PASSWORD=password" >> "$envFile" 2>&1
    fi

    if ! grep -q "PHANTOM_DB_DATABASE" "${envFile}"; then
        echo "PHANTOM_DB_DATABASE=ark_${CORE_NETWORK}" >> "$envFile" 2>&1
    fi

    . "${envFile}"
}

setup_environment ()
{
    set_locale

    if [[ ! -f "$commander_config" ]]; then
        ascii

        install_base_dependencies
        install_program_dependencies
        install_nodejs_dependencies
        install_system_updates

        # create ~/.commander
        touch "$commander_config"

        echo "CORE_REPO=https://github.com/PhantomCore/core" >> "$commander_config" 2>&1
        echo "CORE_BRANCH=master" >> "$commander_config" 2>&1
        echo "CORE_DIR=${HOME}/phantom-core" >> "$commander_config" 2>&1
        echo "CORE_DATA=${HOME}/.phantom" >> "$commander_config" 2>&1
        echo "CORE_CONFIG=${HOME}/.phantom/config" >> "$commander_config" 2>&1
        echo "CORE_TOKEN=phantom" >> "$commander_config" 2>&1
        echo "CORE_NETWORK=mainnet" >> "$commander_config" 2>&1
        echo "EXPLORER_REPO=https://github.com/PhantomCore/explorer" >> "$commander_config" 2>&1
        echo "EXPLORER_DIR=${HOME}/phantom-explorer" >> "$commander_config" 2>&1

        . "$commander_config"

        # create ~/.phantom/.env
        setup_environment_file
        success "All system dependencies have been installed!"

        check_and_recommend_reboot
        press_to_continue
    fi

    if [[ -e "$commander_config" ]]; then
        if ! grep -q "CORE_REPO" "${commander_config}"; then
            echo "CORE_REPO=https://github.com/ArkEcosystem/core" >> "$commander_config" 2>&1
        fi

        if ! grep -q "CORE_BRANCH" "${commander_config}"; then
            echo "CORE_BRANCH=master" >> "$commander_config" 2>&1
        fi

        if ! grep -q "CORE_DIR" "${commander_config}"; then
            echo "CORE_DIR=${HOME}/ark-core" >> "$commander_config" 2>&1
        fi

        if ! grep -q "CORE_DATA" "${commander_config}"; then
            echo "CORE_DATA=${HOME}/.ark" >> "$commander_config" 2>&1
        fi

        if ! grep -q "CORE_CONFIG" "${commander_config}"; then
            echo "CORE_CONFIG=${HOME}/.ark/config" >> "$commander_config" 2>&1
        fi

        if ! grep -q "CORE_TOKEN" "${commander_config}"; then
            echo "CORE_TOKEN=ark" >> "$commander_config" 2>&1
        fi

        if ! grep -q "CORE_NETWORK" "${commander_config}"; then
            echo "CORE_NETWORK=mainnet" >> "$commander_config" 2>&1
        fi

        if ! grep -q "EXPLORER_REPO" "${commander_config}"; then
            echo "EXPLORER_REPO=https://github.com/ArkEcosystem/explorer" >> "$commander_config" 2>&1
        fi

        if ! grep -q "EXPLORER_DIR" "${commander_config}"; then
            echo "EXPLORER_DIR=${HOME}/ark-explorer" >> "$commander_config" 2>&1
        fi

        . "$commander_config"

        setup_environment_file
    fi
}
