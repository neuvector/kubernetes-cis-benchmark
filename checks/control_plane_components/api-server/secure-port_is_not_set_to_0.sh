#!/bin/sh

check_title="Ensure that the --secure-port argument is not set to 0 (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--secure-port' >/dev/null 2>&1; then
    port=$(get_argument_value "$CIS_APISERVER_CMD" '--secure-port'|cut -d " " -f 1)
    if [ "$port" = "0" ]; then
        warn "$check"
        warn "       * secure-port: $port"
    else
        pass "$check"
    fi
else
    pass "$check"
fi
