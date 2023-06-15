#!/bin/sh

check_title="Ensure that the client certificate authorities file ownership is set to root:root (Manual)"
check="$check_number  - $check_title"

if check_argument "$CIS_KUBELET_CMD" '--client-ca-file' >/dev/null 2>&1; then
  file=$(get_argument_value "$CIS_KUBELET_CMD" '--client-ca-file')
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check"
    pass "       * client-ca-file: $file"
  else
    warn "$check"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check"
  info "     * --client-ca-file not set"
fi
