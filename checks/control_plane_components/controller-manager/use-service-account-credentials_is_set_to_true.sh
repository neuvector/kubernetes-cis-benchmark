#!/bin/sh

check_title="Ensure that the --use-service-account-credentials argument is set to true (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_MANAGER_CMD" '--use-service-account-credentials=true' >/dev/null 2>&1; then
    pass "$check"
else
    warn "$check"
fi
