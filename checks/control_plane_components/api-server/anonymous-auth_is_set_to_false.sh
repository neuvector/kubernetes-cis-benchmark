#!/bin/sh

check_title="Ensure that the --anonymous-auth argument is set to false (Manual)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--anonymous-auth=false' >/dev/null 2>&1; then
    pass "$check"
else
    warn "$check"
fi
