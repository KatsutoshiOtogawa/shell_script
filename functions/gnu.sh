#!/bin/bash
#
# gnu command util.

#######################################
# check exists gnu command alias gnu command for Mac.
# gsed, gawk, gxargs,... and many
# Globals:
#   None
# Arguments:
#   None
# Outputs:
#   None
# Returns:
#   0 if thing was set alias, non-zero on error.
# Example:
#   gnu_exists # => you use use sed
#######################################
function gnu_exists {
  # you use Darwin, set alias for use Gnu sed, awk, xargs
  if uname | grep -e Darwin -e BSD > /dev/null; then
    # gsedがなかったら、return 1
    if ! type "gsed" > /dev/null; then
      echo "gsed is not exists." >&2
      return 1
    fi
    if ! type "gawk" > /dev/null; then
      echo "gawk is not exists." >&2
      return 1
    fi
    if ! type "gxargs" > /dev/null; then
      echo "gxargs is not exists." >&2
      return 1
    fi
    if ! type "gfind" > /dev/null; then
      echo "gfind is not exists." >&2
      return 1
    fi
  fi
}

#######################################
# set alias gnu command for Mac.
# Globals:
#   GNU_ALIAS
# Arguments:
#   None
# Outputs:
#   None
# Returns:
#   0 if thing was set alias, non-zero on error.
# Example:
#   gnu_alias # => you use use sed
#######################################
function gnu_alias {
  # include gurad.
  # if you set alias, return.
  if [ -n $GNU_ALIAS ]; then
    return
  fi
  # you use Darwin, set alias for use Gnu sed, awk, xargs
  if uname | grep -e Darwin -e BSD > /dev/null; then
    if ! gnu_exists; then
      echo "Any Gnu command is not exists." >&2
      return 1
    fi
    alias sed=gsed
    alias awk=gawk
    alias xargs=gxargs
    alias find=gfind
    # set variable for 
    GNU_ALIAS=GNU_ALIAS
  fi
}

#######################################
# unalias gnu command for Mac.
# Globals:
#   GNU_ALIAS
# Arguments:
#   None
# Outputs:
#   None
# Returns:
#   0 if thing was deleted, non-zero on error.
# Example:
#   gnu_unalias # => you use use sed
#######################################
function gnu_unalias {
  # you use Darwin, set alias for use Gnu sed, awk, xargs
  if uname | grep -e Darwin -e BSD > /dev/null; then
    unalias sed
    unalias awk
    unalias xargs
    unalias find
    unset GNU_ALIAS
  fi
}
