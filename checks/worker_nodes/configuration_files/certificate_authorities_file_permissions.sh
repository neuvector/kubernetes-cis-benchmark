#!/bin/sh

check_title="Ensure that the certificate authorities file permissions are set to 644 or more restrictive (Manual)"
check="$check_number  - $check_title"

if check_argument "$CIS_KUBELET_CMD" '--client-ca-file' >/dev/null 2>&1; then
  file=$(get_argument_value "$CIS_KUBELET_CMD" '--client-ca-file')
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 600 -o "$(stat -c %a $file)" -eq 400 ]; then
    pass "$check"
    pass "       * client-ca-file: $file"
  else
    warn "$check"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check"
  info "     * --client-ca-file not set"
fi
