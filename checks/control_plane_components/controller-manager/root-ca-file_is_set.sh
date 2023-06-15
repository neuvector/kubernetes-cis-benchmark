#!/bin/sh

check_title="Ensure that the --root-ca-file argument is set as appropriate (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_MANAGER_CMD" '--root-ca-file' >/dev/null 2>&1; then
    cafile=$(get_argument_value "$CIS_MANAGER_CMD" '--root-ca-file')
    pass "$check"
    pass "       * root-ca-file: $cafile"
else
    warn "$check"
fi
