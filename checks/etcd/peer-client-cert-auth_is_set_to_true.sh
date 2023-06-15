#!/bin/sh

check_title="Ensure that the --peer-client-cert-auth argument is set to true (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_ETCD_CMD" '--peer-client-cert-auth=true' >/dev/null 2>&1; then
    pass "$check"
else
    warn "$check"
fi
