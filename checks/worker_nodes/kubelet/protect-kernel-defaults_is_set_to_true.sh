#!/bin/sh

check_title="Ensure that the --protect-kernel-defaults argument is set to true (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_KUBELET_CMD" '--protect-kernel-defaults=true' >/dev/null 2>&1; then
    pass "$check"
else
    warn "$check"
fi
