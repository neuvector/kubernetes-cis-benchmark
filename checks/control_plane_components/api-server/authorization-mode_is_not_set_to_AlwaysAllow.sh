#!/bin/sh

check_title="Ensure that the --authorization-mode argument is not set to AlwaysAllow (Automated)"
check="$check_number  - $check_title"

if get_argument_value "$CIS_APISERVER_CMD" '--authorization-mode'| grep 'AlwaysAllow' >/dev/null 2>&1; then
    warn "$check"
else
    pass "$check"
fi
