#!/bin/sh

check_title="Ensure that the cluster-admin role is only used where required (Manual)"
check="$check_number  - $check_title"

# Make the loop separator be a new-line in POSIX compliant fashion
set -f; IFS=$'
'

cluster_admins=$(kubectl get clusterrolebindings -o=custom-columns=NAME:.metadata.name,ROLE:.roleRef.name,SUBJECT:.subjects[*].name)
info "$check"
for admin in $cluster_admins; do
 	info "     * $admin"
done
