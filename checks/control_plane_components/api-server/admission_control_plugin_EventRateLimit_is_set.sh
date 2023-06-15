#!/bin/sh

check_title="Ensure that the admission control plugin EventRateLimit is set (Manual)"
check="$check_number  - $check_title"

if get_argument_value "$CIS_APISERVER_CMD" '--enable-admission-plugins'| grep 'EventRateLimit' >/dev/null 2>&1; then
    pass "$check"
else
    warn "$check"
fi
