#!/usr/bin/env bash

# --- Guard against double sourcing ---
if [ -n "${BASE_LOGGING_LOADED:-}" ]; then
    return 0
fi

BASE_LOGGING_LOADED=1

# --- Check for name collisions ---
if declare -F base_log_info >/dev/null; then
    echo "Error: base_log_info already defined. Library conflict." >&2
    return 1
fi

_base_log_ts() {
    date +'[%H:%M:%S]'
}

base_log_info() {
    echo "$(_base_log_ts) [INFO]  $*"
}

base_log_warn() {
    echo "$(_base_log_ts) [WARN]  $*" >&2
}

base_log_err() {
    echo "$(_base_log_ts) [ERROR] $*" >&2
}

base_log_ok() {
    echo "$(_base_log_ts) [OK]    $*"
}

base_log_step() {
    echo
    echo "=== $* ==="
}