#!/bin/sh

check_title="Ensure that the --tls-cert-file and --tls-private-key-file arguments are set as appropriate (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--tls-cert-file' >/dev/null 2>&1; then
    if check_argument "$CIS_APISERVER_CMD" '--tls-private-key-file' >/dev/null 2>&1; then
        certfile=$(get_argument_value "$CIS_APISERVER_CMD" '--tls-cert-file')
        keyfile=$(get_argument_value "$CIS_APISERVER_CMD" '--tls-private-key-file')
        pass "$check"
        pass "        * tls-cert-file: $certfile"
        pass "        * tls-private-key-file: $keyfile"
    else
        warn "$check"
    fi
else
    warn "$check"
fi
