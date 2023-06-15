#!/bin/sh

check_title="Minimize access to secrets (Manual)"
check="$check_number  - $check_title"

# Make the loop separator be a new-line in POSIX compliant fashion
set -f; IFS=$'
'

policies=$(kubectl get psp)
info "$check"
for policy in $policies; do
	  info "     * $policy"
done
