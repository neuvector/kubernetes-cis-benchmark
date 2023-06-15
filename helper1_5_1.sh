#!/bin/sh

level2="1.3.6, 2.7, 3.1.1, 3.2.2, 4.2.9, 5.2.9, 5.3.2, 5.4.2, 5.5.1, 5.7.2, 5.7.3, 5.7.4"

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
