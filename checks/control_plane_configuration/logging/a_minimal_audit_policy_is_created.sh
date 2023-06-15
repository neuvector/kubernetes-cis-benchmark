#!/bin/sh

check_title="Ensure that a minimal audit policy is created (Manual)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--audit-policy-file' >/dev/null 2>&1; then
    auditPolicyFile=$(get_argument_value "$CIS_APISERVER_CMD" '--audit-policy-file')
    pass "$check"
    pass "        * audit-policy-file: $auditPolicyFile"
else
    warn "$check"
fi
