#!/bin/sh

check_title="Ensure that the Container Network Interface file ownership is set to root:root (Manual)"
check="$check_number  - $check_title"

# todo find CNI file location

info "$check
       Audit:
       Run the below command (based on the file location on your system) on the master node. For example,
       stat -c %U:%G <path/to/cni/files>
       Verify that the ownership is set to root:root."
