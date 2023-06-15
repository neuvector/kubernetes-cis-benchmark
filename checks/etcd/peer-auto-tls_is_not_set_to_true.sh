#!/bin/sh

check_title="Ensure that the --peer-auto-tls argument is not set to true (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_ETCD_CMD" '--peer-auto-tls=true' >/dev/null 2>&1; then
    warn "$check"
else
    pass "$check"
fi
