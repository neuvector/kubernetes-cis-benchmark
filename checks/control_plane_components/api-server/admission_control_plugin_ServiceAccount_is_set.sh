#!/bin/sh

check_title="Ensure that the admission control plugin ServiceAccount is set (Automated)"
check="$check_number  - $check_title"

if get_argument_value "$CIS_APISERVER_CMD" '--disable-admission-plugins'| grep 'ServiceAccount' >/dev/null 2>&1; then
    warn "$check"
else
    pass "$check"
fi
