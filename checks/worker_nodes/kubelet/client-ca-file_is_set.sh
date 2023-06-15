#!/bin/sh

check_title="Ensure that the --client-ca-file argument is set as appropriate (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_KUBELET_CMD" '--client-ca-file' >/dev/null 2>&1; then
    cafile=$(get_argument_value "$CIS_KUBELET_CMD" '--client-ca-file')
    pass "$check"
    pass "       * client-ca-file: $cafile"
else
    warn "$check"
fi
