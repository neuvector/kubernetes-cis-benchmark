#!/bin/sh

check_title="Ensure that the etcd data directory permissions are set to 700 or more restrictive (Automated)"
check="$check_number  - $check_title"

file=""
if check_argument "$CIS_ETCD_CMD" '--data-dir' >/dev/null 2>&1; then
    file=$(get_argument_value "$CIS_ETCD_CMD" '--data-dir'|cut -d " " -f 1)
fi

if [ -f "$file" ]; then
  if [ "$(stat -c %a $file)" -eq 700 -o "$(stat -c %a $file)" -eq 600 -o "$(stat -c %a $file)" -eq 400 ]; then
    pass "$check"
  else
    warn "$check"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check"
  info "     * etcd data directory not found."
fi
