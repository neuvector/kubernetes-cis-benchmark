#!/bin/sh

check_title="Ensure that the --authorization-mode argument is not set to AlwaysAllow (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_KUBELET_CMD" '--authorization-mode=AlwaysAllow' >/dev/null 2>&1; then
    warn "$check"
else
    pass "$check"
fi
