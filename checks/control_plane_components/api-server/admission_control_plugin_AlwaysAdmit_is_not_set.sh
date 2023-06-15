#!/bin/sh

check_title="Ensure that the admission control plugin AlwaysAdmit is not set (Automated)"
check="$check_number  - $check_title"

if get_argument_value "$CIS_APISERVER_CMD" '--enable-admission-plugins'| grep 'AlwaysAdmit' >/dev/null 2>&1; then
    warn "$check"
else
    pass "$check"
fi
