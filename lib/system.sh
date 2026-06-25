#!/usr/bin/env bash

set -euo pipefail

#
# System helper functions
#

is_root() {
    [[ $EUID -eq 0 ]]
}

is_ubuntu() {
    [[ -f /etc/os-release ]] && grep -q "^ID=ubuntu$" /etc/os-release
}

get_architecture() {
    dpkg --print-architecture
}

get_ubuntu_version() {
    . /etc/os-release
    echo "$VERSION_ID"
}