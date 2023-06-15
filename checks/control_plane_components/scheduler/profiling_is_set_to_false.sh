#!/bin/sh

check_title="Ensure that the --profiling argument is set to false (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_SCHEDULER_CMD" '--profiling=false' >/dev/null 2>&1; then
  	pass "$check"
else
  	warn "$check"
fi
