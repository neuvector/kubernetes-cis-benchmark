#!/bin/sh

check_title="Ensure that the Kubernetes PKI directory and file ownership is set to root:root (Automated)"
check="$check_number  - $check_title"

file="/etc/kubernetes/pki/"

files=$(find $file)
pass=true
for f in ${files}; do
  if [ "$(stat -c %u%g $f)" != 00 ]; then
    pass=false;
    break;
  fi
done

if [ "$pass" = "true" ]; then
  pass "$check"
else
  warn "$check"
fi