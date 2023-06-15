#!/bin/sh

check_title="Ensure that the Container Network Interface file permissions are set to 644 or more restrictive (Manual)"
check="$check_number  - $check_title"

# todo find CNI file location

info "$check
       Audit:
       Run the below command (based on the file location on your system) on the master node. For example,
       stat -c %a <path/to/cni/files>
       Verify that the permissions are 644 or more restrictive."
