#!/bin/sh

check_title="Ensure that the --hostname-override argument is not set (Manual)"
check="$check_number  - $check_title"

if check_argument "$CIS_KUBELET_CMD" '--hostname-override' >/dev/null 2>&1; then
    warn "$check"
else
    pass "$check"
fi
