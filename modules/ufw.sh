#!/usr/bin/env bash

configure_ufw() {

    if ! command_exists ufw; then

        log_info "Installing UFW..."

        apt install -y ufw

    else

        log_skip "UFW already installed."

    fi

    log_info "Configuring UFW..."

    ufw default deny incoming
    ufw default allow outgoing

    if ! ufw status | grep -q "OpenSSH"; then
        ufw allow OpenSSH
    fi

    if ! ufw status | grep -q "Status: active"; then
        ufw --force enable
    fi

    log_success "UFW configured."

    return 0
}