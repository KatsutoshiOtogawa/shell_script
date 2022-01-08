
# source gnu.sh

#######################################
# check g++ library_path g++ compiler search.
# Globals:
#   GNU_ALIAS
# Arguments:
#   None
# Outputs:
#   g++ search libary_path.
# Returns:
#   0 if exists gnu commands, non-zero on error.
# Example:
#   library_path # => show
#######################################
function g++library_path {
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

  # check command for shellscript
  if ! type "g++" > /dev/null; then
      echo "g++ is not exists." >&2
      return 1
  fi
  if ! type "realpath" > /dev/null; then
      echo "realpath is not exists." >&2
      return 1
  fi 
  # 
  # xargs only line, delete blank line.
  g++ -print-search-dirs | \
    grep libraries | \
    sed 's/libraries: =//' | \
    xargs -d ':' -n 1 realpath 2> /dev/null | \
    xargs -n 1 | \
    sed 's|/$||' | \
    sort | uniq

}

#######################################
# g++ find library_file from g++ compiler path
# Globals:
#   GNU_ALIAS
# Arguments:
#   library_file: assigned file.
# Outputs:
#   g++ search libary_path.
# Returns:
#   0 if find library, non-zero on error or not found library.
# Example:
#   g++find_library libsodium.so => show
#######################################
function g++find_library {
  local library_file=$1
  # if $include_file not exists, return function.
  if [ -z $library_file ]; then
      echo "${library_file} is not exists." >&2
      return 1
  fi

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

  local library_files=$(g++library_path | \
    xargs -I {} find {} -name ${library_file})

  # if doesn't match path, return 1
  if [ -z $library_files ]; then
    return 1
  fi

  # out put match files.
  echo "${library_files[@]}" | xargs -n 1
}


function g++include_path () {
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
  local tmpfile=$(mktemp)
  # remove temporary file return function 
  trap "
    rm ${tmpfile}
    trap - RETURN
  " RETURN

  # output 
  g++ -x c++ -v -E /dev/null < /dev/null > $tmpfile

  local line_num=$(cat ${tmpfile} | wc -l)
  # ファイルで全検索のデータから判断する。
  cat $tmpfile | \
    grep -A $line_num "include .* search starts" | \
    grep -B $line_num "End of search list" | \
    grep -v "include .* search starts" | \
    grep -v "End of search list"  | \
    sed 's/ //g'
}

function g++find_include {
  local include_file=$1
  # if $include_file not exists, return function.
  if [ -z $include_file ]; then
      echo "${include_file} is not exists." >&2
      return 1
  fi

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

  # 
  local include_files=$(g++include_path | \
    xargs -I {} find {} -name ${include_file})

  # if doesn't match path, return 1
  if [ -z $include_files ]; then
    return 1
  fi

  # out put match files.
  echo "${include_files[@]}" | xargs -n 1

}

