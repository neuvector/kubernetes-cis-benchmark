#!/bin/sh

check_title="Ensure that the Kubernetes PKI key file permissions are set to 600 (Manual)"
check="$check_number  - $check_title"

file="/etc/kubernetes/pki/"

files=$(find $file -name "*.key")
pass=true
for f in ${files}; do
  if ! [ "$(stat -c %a $f)" -eq 600 ]; then
    pass=false;
    break;
  fi
done

if [ "$pass" = "true" ]; then
  pass "$check"
else
  warn "$check"
fi
