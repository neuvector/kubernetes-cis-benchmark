#!/bin/sh

check_title="Ensure that the --kubelet-https argument is set to true (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--kubelet-https=false' >/dev/null 2>&1; then
    warn "$check"
else
    pass "$check"
fi
