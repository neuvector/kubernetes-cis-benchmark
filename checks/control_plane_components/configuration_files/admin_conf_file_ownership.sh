#!/bin/sh

check_title="Ensure that the admin.conf file ownership is set to root:root (Automated)"
check="$check_number  - $check_title"

file="/etc/kubernetes/admin.conf"

if [ -f "$file" ]; then
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check"
  else
    warn "$check"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check"
fi
