#!/bin/sh

check_title="Ensure that the --kubelet-certificate-authority argument is set as appropriate (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--kubelet-certificate-authority' >/dev/null 2>&1; then
    pass "$check"
else
    warn "$check"
fi
