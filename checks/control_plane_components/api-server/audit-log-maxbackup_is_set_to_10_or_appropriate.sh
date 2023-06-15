#!/bin/sh

check_title="Ensure that the --audit-log-maxbackup argument is set to 10 or as appropriate (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--audit-log-maxbackup' >/dev/null 2>&1; then
    maxbackup=$(get_argument_value "$CIS_APISERVER_CMD" '--audit-log-maxbackup'|cut -d " " -f 1)
    if [ "$maxbackup" -ge "10" ]; then
        pass "$check"
        pass "        * audit-log-maxbackup: $maxbackup"
    else
        warn "$check"
        warn "        * audit-log-maxbackup: $maxbackup"
    fi
else
    warn "$check"
fi
