#!/usr/bin/env bash

database_drop_user ()
{
    heading "Dropping Database User..."

    sudo -u postgres dropuser --if-exists "${PHANTOM_DB_USERNAME}" | tee -a "$commander_log"

    success "Dropped Database User!"
}

database_destroy ()
{
    heading "Destroying Database..."

    sudo -u postgres dropdb --if-exists "${PHANTOM_DB_DATABASE}" | tee -a "$commander_log"

    success "Destroyed Database!"
}

database_create ()
{
    ascii

    heading "Creating Database..."

    wait_to_continue

    local userExists=$(sudo -u postgres psql -c "SELECT * FROM pg_user WHERE usename = '$PHANTOM_DB_USERNAME'" | grep -c "1 row")

    if [[ $userExists == 1 ]]; then
        read -p "The database user ${PHANTOM_DB_USERNAME} already exists, do you want to overwrite it? [y/N] : " choice

        if [[ "$choice" =~ ^(yes|y|Y) ]]; then
            sudo -u postgres psql -c "DROP USER $PHANTOM_DB_USERNAME" | tee -a "$commander_log"
            sudo -u postgres psql -c "CREATE USER $PHANTOM_DB_USERNAME WITH PASSWORD 'password' CREATEDB;" | tee -a "$commander_log"
        fi
    else
        sudo -u postgres psql -c "CREATE USER $PHANTOM_DB_USERNAME WITH PASSWORD 'password' CREATEDB;" | tee -a "$commander_log"
    fi

    local databaseExists=$(psql -l | grep "${PHANTOM_DB_DATABASE}" | wc -l)

    if [[ $databaseExists == 1 ]]; then
        read -p "The database ${PHANTOM_DB_DATABASE} already exists, do you want to overwrite it? [y/N] : " choice

        if [[ "$choice" =~ ^(yes|y|Y) ]]; then
            dropdb "${PHANTOM_DB_DATABASE}" | tee -a "$commander_log"
            createdb "${PHANTOM_DB_DATABASE}" | tee -a "$commander_log"
        fi
    else
        createdb "${PHANTOM_DB_DATABASE}" | tee -a "$commander_log"
    fi

    wait_to_continue

    success "Created Database!"
}
