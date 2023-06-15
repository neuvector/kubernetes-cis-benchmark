#!/bin/sh

check_title="Ensure that the --token-auth-file parameter is not set (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--token-auth-file' >/dev/null 2>&1; then
    warn "$check"
else
    pass "$check"
fi
