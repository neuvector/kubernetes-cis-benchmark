#!/bin/sh

check_title="Ensure that the admission control plugin SecurityContextDeny is set if PodSecurityPolicy is not used (Manual)"
check="$check_number  - $check_title"

if get_argument_value "$CIS_APISERVER_CMD" '--enable-admission-plugins'| grep 'PodSecurityPolicy' >/dev/null 2>&1; then
    pass "$check"
else
  if get_argument_value "$CIS_APISERVER_CMD" '--enable-admission-plugins'| grep 'SecurityContextDeny' >/dev/null 2>&1; then
    pass "$check"
  else
    warn "$check"
  fi
fi
