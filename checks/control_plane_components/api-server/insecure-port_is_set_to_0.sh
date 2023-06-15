#!/bin/sh

check_title="Ensure that the --insecure-port argument is set to 0 (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--insecure-port' >/dev/null 2>&1; then
    port=$(get_argument_value "$CIS_APISERVER_CMD" '--insecure-port'|cut -d " " -f 1)
    if [ "$port" = "0" ]; then
        pass "$check"
    else
        warn "$check"
        warn "       * insecure-port: $port"
    fi
else
    warn "$check"
fi
