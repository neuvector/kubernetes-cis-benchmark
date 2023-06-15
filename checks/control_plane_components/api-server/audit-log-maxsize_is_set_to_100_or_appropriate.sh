#!/bin/sh

check_title="Ensure that the --audit-log-maxsize argument is set to 100 or as appropriate (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--audit-log-maxsize' >/dev/null 2>&1; then
    maxsize=$(get_argument_value "$CIS_APISERVER_CMD" '--audit-log-maxsize'|cut -d " " -f 1)
    if [ "$maxsize" -ge "100" ]; then
        pass "$check"
        pass "        * audit-log-maxsize: $maxsize"
    else
        warn "$check"
        warn "        * audit-log-maxsize: $maxsize"
    fi
else
    warn "$check"
fi
