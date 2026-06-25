#!/usr/bin/env bash

set -euo pipefail

#
# Common helper functions
#

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

update_package_index() {
    log_info "Updating package index..."
    apt update
}

install_package() {

    local package="$1"
    local command="$2"
    local display_name="$3"

    if command_exists "$command"; then
        log_skip "$display_name already installed."
        return 0
    fi

    log_info "Installing $display_name..."

    apt install -y "$package"

    if ! command_exists "$command"; then
        log_error "Failed to install $display_name."
        return 1
    fi

    log_success "$display_name installed."

    return 0
}