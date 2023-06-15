#!/bin/sh

check_title="Ensure that the Kubernetes PKI certificate file permissions are set to 644 or more restrictive (Manual)"
check="$check_number  - $check_title"

file="/etc/kubernetes/pki/"

files=$(find $file -name "*.crt")
pass=true
for f in ${files}; do
  if ! [ "$(stat -c %a $f)" -eq 644 -o "$(stat -c %a $f)" -eq 600 -o "$(stat -c %a $f)" -eq 400 ]; then
    pass=false;
    break;
  fi
done

if [ "$pass" = "true" ]; then
  pass "$check"
else
  warn "$check"
fi
