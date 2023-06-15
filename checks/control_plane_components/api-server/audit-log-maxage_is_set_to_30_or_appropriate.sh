#!/bin/sh

check_title="Ensure that the --audit-log-maxage argument is set to 30 or as appropriate (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--audit-log-maxage' >/dev/null 2>&1; then
    maxage=$(get_argument_value "$CIS_APISERVER_CMD" '--audit-log-maxage'|cut -d " " -f 1)
    if [ "$maxage" -ge "30" ]; then
        pass "$check"
        pass "        * audit-log-maxage: $maxage"
    else
        warn "$check"
        warn "        * audit-log-maxage: $maxage"
    fi
else
    warn "$check"
fi
