#!/bin/sh
# ------------------------------------------------------------------------------
# Kubenetes CIS benchmark 
#
# Neuvector, Inc. (c) 2016-
#
# ------------------------------------------------------------------------------

CIS_KUBELET_CMD=${CIS_KUBELET_CMD:-kubelet}

# Load dependencies
v_151="1.5.1"
v_141="1.4.1"

case $1 in
  $v_151)
    . ./helper1_5_1.sh
    ;;
  $v_141)
    . ./helper1_4_1.sh
    ;;
  *)
    . ./helper.sh
    ;;
esac

ver=$1
if [ -z "$1" ]; then
  warn "usage: ./worker.sh version"
	exit
fi
# Check for required program(s)
req_progs='awk grep pgrep sed'
for p in $req_progs; do
  command -v "$p" >/dev/null 2>&1 || { printf "%s command not found.\n" "$p"; exit 1; }
done

# Load all the tests from worker/ and run them
main () {

  for audit in $ver/worker/*.sh
  do
     . ./"$audit"
  done
}

main "$@"
