#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#
# Libraries
#

source "$PROJECT_ROOT/lib/logger.sh"
source "$PROJECT_ROOT/lib/common.sh"
source "$PROJECT_ROOT/lib/system.sh"

#
# Modules
#

source "$PROJECT_ROOT/modules/git.sh"
source "$PROJECT_ROOT/modules/curl.sh"
source "$PROJECT_ROOT/modules/jq.sh"
source "$PROJECT_ROOT/modules/tree.sh"
source "$PROJECT_ROOT/modules/docker.sh"
source "$PROJECT_ROOT/modules/ufw.sh"

echo
echo "========================================"
echo " Cloud Bootstrap"
echo "========================================"
echo

if ! is_root; then
    log_error "Please run as root."
    exit 1
fi

if ! is_ubuntu; then
    log_error "Ubuntu is required."
    exit 1
fi

log_success "Environment check passed."

echo

update_package_index

install_git || exit 1
install_curl || exit 1
install_jq || exit 1
install_tree || exit 1
install_docker || exit 1
configure_ufw || exit 1

echo
log_success "Bootstrap completed."
echo