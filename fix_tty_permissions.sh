#!/usr/bin/env bash
# fix_tty_permissions.sh
# Ensures gui user can write to /dev/tty1

set -euo pipefail

USER=gui
TTY_DEV=/dev/tty1

log() {
  echo -e "[tty-fix] $*"
}

# 1. Check if user exists
if ! id "$USER" &>/dev/null; then
  log "User '$USER' not found. Aborting."
  exit 1
fi

# 2. Add user to tty group if not already in it
if ! id -nG "$USER" | grep -qw tty; then
  log "Adding '$USER' to group 'tty'"
  usermod -aG tty "$USER"
else
  log "'$USER' already in 'tty' group"
fi

# 3. Fix current /dev/tty1 permissions
log "Fixing permissions on $TTY_DEV"
chmod g+rw "$TTY_DEV"
chgrp tty "$TTY_DEV"

log "Done. May require logout or reboot."
