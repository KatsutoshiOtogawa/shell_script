#!/bin/bash
#
# utils, often use.

#######################################
# write stderr syntax. google style(https://google.github.io/styleguide/shellguide.html)
# Globals:
#   None
# Arguments:
#   All.
# Outputs:
#   None
# Returns:
#   0 if thing was set alias, non-zero on error.
# Example:
#   convert_youtubedl_line file
#######################################
function convert_youtubedl_line {
  # set gnu alias.
  if [ -z $GNU_ALIAS ]; then
    if ! gnu_alias; then
      return 1;
    fi
    # unalias gnu command
    trap '
      gnu_unalias
      trap - RETURN
    ' RETURN
  fi
  if ! type "youtube-dl" > /dev/null; then
    echo "youtube-dl is not exists." >&2
    return 1
  fi

  local filepath=$1
  # urllist
  # if you ,use pipe line value.
  if [ -z $filepath ]; then
      filepath=-
  fi
  cat $filepath | xargs -I {} echo youtube-dl {}
}
