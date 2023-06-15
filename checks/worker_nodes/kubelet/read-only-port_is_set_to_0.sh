#!/bin/sh

check_title="Ensure that the --read-only-port argument is set to 0 (Manual)"
check="$check_number  - $check_title"

if check_argument "$CIS_KUBELET_CMD" '--read-only-port' >/dev/null 2>&1; then
    port=$(get_argument_value "$CIS_KUBELET_CMD" '--read-only-port' | cut -d " " -f 1)
    if [ $port = "0" ]; then
        pass "$check"
    else
        warn "$check"
        warn "       * read-only-port: $port"
    fi
else
    warn "$check"
fi
