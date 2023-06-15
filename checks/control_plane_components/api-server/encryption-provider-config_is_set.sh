#!/bin/sh

check_title="Ensure that the --encryption-provider-config argument is set as appropriate (Manual)"
check="$check_number  - $check_title"

if get_argument_value "$CIS_APISERVER_CMD" '--encryption-provider-config'| grep 'EncryptionConfig' >/dev/null 2>&1; then
    pass "$check"
else
    warn "$check"
fi
