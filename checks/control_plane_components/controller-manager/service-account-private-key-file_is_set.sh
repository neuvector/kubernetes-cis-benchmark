#!/bin/sh

check_title="Ensure that the --service-account-private-key-file argument is set as appropriate (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_MANAGER_CMD" '--service-account-private-key-file' >/dev/null 2>&1; then
    keyfile=$(get_argument_value "$CIS_MANAGER_CMD" '--service-account-private-key-file')
    pass "$check"
    pass "       * service-account-private-key-file: $keyfile"
else
    warn "$check"
fi
