#!/bin/sh

check_title="Ensure that the etcd data directory ownership is set to etcd:etcd (Automated)"
check="$check_number  - $check_title"

file=""
if check_argument "$CIS_ETCD_CMD" '--data-dir' >/dev/null 2>&1; then
    file=$(get_argument_value "$CIS_ETCD_CMD" '--data-dir'|cut -d " " -f 1)
fi

if [ -f "$file" ]; then
  if [ "$(stat -c %U:%G $file)" = "etcd:etcd" ]; then
    pass "$check"
  else
    warn "$check"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check"
  info "     * etcd data directory not found."
fi