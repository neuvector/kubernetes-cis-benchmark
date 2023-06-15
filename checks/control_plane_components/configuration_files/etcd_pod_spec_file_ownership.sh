#!/bin/sh

check_title="Ensure that the etcd pod specification file ownership is set to root:root (Automated)"
check="$check_number  - $check_title"

if [ -f "/etc/kubernetes/manifests/etcd.yaml" ]; then
    file="/etc/kubernetes/manifests/etcd.yaml"
else
    # kops
    file="/etc/kubernetes/manifests/etcd.manifest"
fi

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
