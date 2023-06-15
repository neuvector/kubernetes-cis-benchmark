#!/bin/sh

check_title="Ensure that the API server pod specification file ownership is set to root:root (Automated)"
check="$check_number  - $check_title"

if [ -f "/etc/kubernetes/manifests/kube-apiserver.manifest" ]; then
    # kops
    file="/etc/kubernetes/manifests/kube-apiserver.manifest"
else
    file="/etc/kubernetes/manifests/kube-apiserver.yaml"
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
