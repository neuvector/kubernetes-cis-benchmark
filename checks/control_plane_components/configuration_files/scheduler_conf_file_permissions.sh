#!/bin/sh

check_title="Ensure that the scheduler.conf file permissions are set to 644 or more restrictive (Automated)"
check="$check_number  - $check_title"

file="/etc/kubernetes/scheduler.conf"

if [ -f "$file" ]; then
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 600 -o "$(stat -c %a $file)" -eq 400 ]; then
    pass "$check"
  else
    warn "$check"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check"
  info "     * File not found"
fi
