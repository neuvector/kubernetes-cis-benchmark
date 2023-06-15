#!/bin/sh

check_title="Ensure that the RotateKubeletServerCertificate argument is set to true (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_MANAGER_CMD" '--feature-gates' >/dev/null 2>&1; then
    serverCert=$(get_argument_value "$CIS_MANAGER_CMD" '--feature-gates')
    found=$(echo $serverCert| grep 'RotateKubeletServerCertificate=true')
    if [ ! -z $found ]; then
      pass "$check"
    else
      warn "$check"
    fi
else
    warn "$check"
fi
