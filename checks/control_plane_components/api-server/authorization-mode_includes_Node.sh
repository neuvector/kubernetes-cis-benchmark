#!/bin/sh

check_title="Ensure that the --authorization-mode argument includes Node (Automated)"
check="$check_number  - $check_title"

if get_argument_value "$CIS_APISERVER_CMD" '--authorization-mode'| grep 'Node' >/dev/null 2>&1; then
    pass "$check"
else
    warn "$check"
fi
