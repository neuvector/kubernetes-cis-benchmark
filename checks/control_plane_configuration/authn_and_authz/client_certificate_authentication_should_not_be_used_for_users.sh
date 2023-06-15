#!/bin/sh

check_title="Client certificate authentication should not be used for users (Manual)"
check="$check_number  - $check_title"

info "$check"
info "        * Review user access to the cluster and ensure that users are not making use of Kubernetes client certificate authentication."
