#!/bin/sh

check_title="Ensure that the etcd pod specification file permissions are set to 644 or more restrictive (Automated)"
check="$check_number  - $check_title"

if [ -f "/etc/kubernetes/manifests/etcd.yaml" ]; then
    file="/etc/kubernetes/manifests/etcd.yaml"
else
    # kops
    file="/etc/kubernetes/manifests/etcd.manifest"
fi

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
