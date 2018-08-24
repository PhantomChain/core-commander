#!/usr/bin/env bash

menu_manage_explorer_help ()
{
    ascii

    text_yellow "    Install PHANTOM Explorer (I)"
    text_white "    installs PHANTOM Explorer on your server."
    echo

    text_yellow "    Stop PHANTOM Explorer (K)"
    text_white "    stops the PHANTOM Explorer process (shown only if the PHANTOM Explorer process is running)."
    echo

    text_yellow "    Start PHANTOM Explorer (S)"
    text_white "    starts the PHANTOM Explorer process (shown only if PHANTOM Explorer is installed)."
    echo

    text_yellow "    Restart PHANTOM Explorer (R)"
    text_white "    restarts (stops and then starts) the PHANTOM Explorer process (shown only if PHANTOM Explorer is installed and running)."
    echo

    text_yellow "    Update PHANTOM Explorer (U)"
    text_white "    updates PHANTOM Explorer if a new version is available (shown only if PHANTOM Explorer is installed)."
    echo

    text_yellow "    Uninstall PHANTOM Explorer (P)"
    text_white "    uninstalls PHANTOM Explorer from your system (shown only if PHANTOM Explorer is installed)."
    echo

    text_yellow "    Show Log (L)"
    text_white "    shows the PM2 explorer process log."
    echo

    text_yellow "    Show Help (H)"
    text_white "    opens the help file where all this information is available."

    divider

    text_blue "    For more information head over to https://phantomdocs.readme.io/"
    echo

    press_to_continue

    menu_main
}
