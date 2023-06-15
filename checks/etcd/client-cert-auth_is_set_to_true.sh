#!/bin/sh

check_title="Ensure that the --client-cert-auth argument is set to true (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_ETCD_CMD" '--client-cert-auth' >/dev/null 2>&1; then
    pass "$check"
else
    warn "$check"
fi
