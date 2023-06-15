#!/bin/sh

check_title="Ensure that encryption providers are appropriately configured (Manual)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--encryption-provider-config' >/dev/null 2>&1; then
    encryptionConfig=$(get_argument_value "$CIS_APISERVER_CMD" '--encryption-provider-config')
    if [ -f "$encryptionConfig" ]; then
      if [ $(grep -c "\- aescbc:\|\- kms:\|\- secretbox:" $encryptionConfig) -ne 0 ]; then
        pass "$check"
      else
        warn "$check"
      fi
    else
      warn "$check"
    fi
else
    warn "$check"
fi

#if get_argument_value "$CIS_APISERVER_CMD" '--experimental-encryption-provider-config'| grep 'EncryptionConfig' >/dev/null 2>&1; then
#    encryptionConfig=$(get_argument_value "$CIS_APISERVER_CMD" '--experimental-encryption-provider-config')
#    if sed ':a;N;$!ba;s/\n/ /g' $encryptionConfig |grep "providers:\s* - aescbc" >/dev/null 2>&1; then
#        pass "$check"
#    else
#        warn "$check"
#    fi
#else
#    warn "$check"
#fi
