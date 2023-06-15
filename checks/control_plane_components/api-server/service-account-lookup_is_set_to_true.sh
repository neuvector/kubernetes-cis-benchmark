#!/bin/sh

check_title="Ensure that the --service-account-lookup argument is set to true (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--service-account-lookup=false' >/dev/null 2>&1; then
    warn "$check"
else
    pass "$check"
fi
