#!/bin/sh

check_title="Ensure that the --insecure-bind-address argument is not set (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--insecure-bind-address' >/dev/null 2>&1; then
    warn "$check"
else
    pass "$check"
fi
