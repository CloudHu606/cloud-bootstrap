#!/usr/bin/env bash

install_docker() {

    if command_exists docker; then
        log_skip "Docker already installed."
        return 0
    fi

    log_info "Installing Docker..."

    #
    # Prerequisites
    #

    apt install -y \
        ca-certificates \
        curl \
        gnupg

    #
    # Docker GPG Key
    #

    install -m 0755 -d /etc/apt/keyrings

    if [[ ! -f /etc/apt/keyrings/docker.asc ]]; then

        curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
            -o /etc/apt/keyrings/docker.asc

        chmod a+r /etc/apt/keyrings/docker.asc
    fi

    #
    # Docker Repository
    #

    if [[ ! -f /etc/apt/sources.list.d/docker.list ]]; then

        echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
> /etc/apt/sources.list.d/docker.list

        apt update
    fi

    #
    # Install Docker
    #

    apt install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin

    #
    # Verify
    #

    if ! command_exists docker; then
        log_error "Failed to install Docker."
        return 1
    fi

    log_success "Docker installed."

    return 0
}