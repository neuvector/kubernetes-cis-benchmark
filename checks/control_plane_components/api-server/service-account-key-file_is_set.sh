#!/bin/sh

check_title="Ensure that the --service-account-key-file argument is set as appropriate (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--service-account-key-file' >/dev/null 2>&1; then
    file=$(get_argument_value "$CIS_APISERVER_CMD" '--service-account-key-file')
    pass "$check"
    pass "        * service-account-key-file: $file"
else
    warn "$check"
fi
