#!/bin/sh

check_title="Ensure that the audit policy covers key security concerns (Manual)"
check="$check_number  - $check_title"

info "$check"
info "        * Access to Secrets managed by the cluster. Care should be taken to only log Metadata for requests to Secrets, ConfigMaps, and TokenReviews, in order to avoid the risk of logging sensitive data."
info "        * Modification of pod and deployment objects."
info "        * Use of pods/exec, pods/portforward, pods/proxy and services/proxy."
