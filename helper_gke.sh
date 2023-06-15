#!/bin/sh

level2="1.3.6, 2.7, 3.1.1, 3.2.2, 4.2.9, 5.2.6, 5.2.9, 5.3.2, 5.4.2, 5.6.2, 5.6.3, 5.6.4,
6.1.4, 6.2.1, 6.4.2, 6.5.1, 6.5.7, 6.6.1, 6.6.4, 6.6.8, 6.7.2, 6.8.3, 6.10.4, 6.10.5"

info () {

  s_txt=""
  if echo "$1" | grep -q "(Scored)"; then
    s_txt="${bldcyn}[Scored]${txtrst}"
  elif echo "$1" | grep -q "(Not Scored)"; then
    s_txt="${bldcyn}[Not Scored]${txtrst}"
  fi

  level_txt=""
  if [ ${#s_txt} -ne 0 ]; then
    idx=$(echo "$1" | cut -d " " -f 1)
    if echo "$level2" | grep -q "\<${idx}\>"; then
      level_txt="${bldgry}[Level 2]${txtrst}"
    else
      level_txt="${bldgry}[Level 1]${txtrst}"
    fi
  fi

  printf "%b\n" "${bldblu}[INFO]${txtrst}${level_txt}${s_txt} $1"
}

pass () {

  s_txt=""
  if echo "$1" | grep -q "(Scored)"; then
    s_txt="${bldcyn}[Scored]${txtrst}"
  elif echo "$1" | grep -q "(Not Scored)"; then
    s_txt="${bldcyn}[Not Scored]${txtrst}"
  fi

  level_txt=""
  if [ ${#s_txt} -ne 0 ]; then
    idx=$(echo "$1" | cut -d " " -f 1)
    if echo "$level2" | grep -q "\<${idx}\>"; then
      level_txt="${bldgry}[Level 2]${txtrst}"
    else
      level_txt="${bldgry}[Level 1]${txtrst}"
    fi
  fi

  printf "%b\n" "${bldgrn}[PASS]${txtrst}${level_txt}${s_txt} $1"

}

warn () {
  s_txt=""
  if echo "$1" | grep -q "(Scored)"; then
    s_txt="${bldcyn}[Scored]${txtrst}"
  elif echo "$1" | grep -q "(Not Scored)"; then
    s_txt="${bldcyn}[Not Scored]${txtrst}"
  fi

  level_txt=""
  if [ ${#s_txt} -ne 0 ]; then
    idx=$(echo "$1" | cut -d " " -f 1)
    if echo "$level2" | grep -q "\<${idx}\>"; then
      level_txt="${bldgry}[Level 2]${txtrst}"
    else
      level_txt="${bldgry}[Level 1]${txtrst}"
    fi
  fi

  printf "%b\n" "${bldred}[WARN]${txtrst}${level_txt}${s_txt} $1"

}

yell "# ------------------------------------------------------------------------------
# Kubernetes CIS benchmark
#
# NeuVector, Inc. (c) 2020-
#
# NeuVector delivers an application and network intelligent container security
# solution that automatically adapts to protect running containers. Don’t let
# security concerns slow down your CI/CD processes.
# ------------------------------------------------------------------------------"

#get an argument value from command line
get_argument_value() {
    CMD="$1"
    OPTION="$2"

    get_command_line_args "$CMD" |
    sed \
        -e 's/\-\-/\n--/g' \
        |
    grep "^${OPTION}" |
    sed \
        -e "s/^${OPTION}[= ]//g"
}
