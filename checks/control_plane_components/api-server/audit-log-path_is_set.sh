#!/bin/sh

check_title="Ensure that the --audit-log-path argument is set (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--audit-log-path' >/dev/null 2>&1; then
    pass "$check"
else
    warn "$check"
fi
