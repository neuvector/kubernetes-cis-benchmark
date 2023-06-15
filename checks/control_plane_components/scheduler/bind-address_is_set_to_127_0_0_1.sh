#!/bin/sh

check_title="Ensure that the --bind-address argument is set to 127.0.0.1 (Automated)"
check="$check_number  - $check_title"

if get_argument_value "$CIS_SCHEDULER_CMD" '--bind-address'| grep '127.0.0.1' >/dev/null 2>&1; then
  	pass "$check"
else
  	warn "$check"
fi
