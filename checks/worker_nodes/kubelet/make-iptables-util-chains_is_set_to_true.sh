#!/bin/sh

check_title="Ensure that the --make-iptables-util-chains argument is set to true (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_KUBELET_CMD" '--make-iptables-util-chains=true' >/dev/null 2>&1; then
    pass "$check"
else
    warn "$check"
fi
