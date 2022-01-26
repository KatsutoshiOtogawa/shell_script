#!/bin/bash
#
# utils, often use.

#######################################
# Delete file_header for bash_script. shebang and below 2 line
# Globals:
#   None
# Arguments:
#   Stdout to delete comment ,a path. this param 
# Outputs:
#   Writes lines delete file_header.
# Returns:
#   0 if thing was deleted, non-zero on error.
# Example:
#   cat file | delete_file_header
#   delete_file_header file
#######################################
function delete_file_header {
  # set gnu alias.
  if ! gnu_alias; then
    return 1;
  fi

  local filepath=$1
  # - filepath
  if [ -z $filepath ]; then
    echo 'select filepath ' >&2
    return 1
  fi

  # 最初の二行飛ばす。
  cat $filepath | sed '1,2d'
}

#######################################
# cat 
# Globals:
#   None
# Arguments:
#   Stdout to delete comment ,a path. this param 
# Outputs:
#   Writes lines delete file_header.
# Returns:
#   0 if thing was deleted, non-zero on error.
# Example:
#   cat file | delete_file_header
#   delete_file_header file
#######################################
function cat_map_delete_file_header {
  # set gnu alias.
  if ! gnu_alias; then
    return 1;
  fi
  local filelist=$@
  if [ -z $filelist ]; then
    filelist=`cat -`
  fi
  # check file exists
  if file_exists $filelist; then
    return 1
  fi
  # map function
  cat_map delete_file_header $filelist
}

#######################################
# select menu items
# Globals:
#   PS3
#   REPLY
# Arguments:
#   PS3 variable
#   after args menu items.
# Outputs:
#   None
# Returns:
#   0 if select exists menu, non-zero on error occured.
# Example:
#   $ select_menu 'your like cooking' hamburger curry sushi
#   1) hamburger
#   2) curry
#   3) sushi
#   your like cooking. Enter 'q' for cancel. > 1
#   $ if "${?}" != 0; then
#   >   echo 'error occured select_menu function.' >&2
#   >   return 1 
#   > fi
#   $ if "${REPLY}" = 'q'; then
#   >   echo 'user cancel' 
#   >   return
#   > fi
#   $ echo $REPLY 
#######################################
function select_menu {
  # check input select message
  if [ -z $1 ]; then
    echo 'input select message!' >&2
    return 1
  fi
  PS3="${1} Enter 'q' for cancel. > "
  # args after two index, assined menu variable.
  local menu=(${@:2:($#-1)})
  if [ -z $menu ]; then
    echo 'set variable for select menu' >&2
    return 1
  fi
  # loop for select menu.
  local item
  select item in "${menu[@]}"
  do
    if [ "${REPLY}" = "q" ]; then
      return
    fi
    # break loop for select existing menu.
    if [ -z $item ]; then
      break
    fi
    echo "invalid selection. choose select menu" >&2
  done
}

#######################################
# check super user.
# Globals:
#   None
# Arguments:
#   alphabet number
# Outputs:
#   alphabet order of alphabet. 0 => a, 25 => z, 26 => aa ...
# Returns:
#   0 if normal end, non-zero on error occured.
# Example:
#   convert2alpha 100 # => dw
#######################################
function convert2alpha {
  local alphabet=($(echo {a..z}))
  local ten_base_num=$1
  
  if [ -z $ten_base_num ]; then
    echo 'assign parameter ten_base_num!' >&2
    return 1
  fi
  # 0 未満の値の時のみエラ-
  if [ $ten_base_num -lt 0 ]; then
    echo '1 greater value' >&2
    return 1
  fi
  
  # 0 -> a
  # 0から始まる数字は8進数と勝手に解釈されるので先頭の0は削除
  # 0は00に直してから、最初の0を削除する。
  twenty_six_base_num=(
    $(echo "obase=26; ibase=10; ${ten_base_num}" | \
      bc | xargs -n 1 | \
      gsed 's/^0$/00/g' | \
      gsed 's/^0//g'
    )
  )
  if [ -n $2 ]; then 
    # 対話形式でないのでswithでやるべき。
    if [ "$2" = "upper" ]; then
      alphabet=($(echo "${alphabet[@]}" | tr "a-z" "A-Z"))
    fi
  fi

  local i
  local str
  for ((i=0; i < ${#twenty_six_base_num[@]}; i++)); do
    local alpha_num="${twenty_six_base_num[${i}]}"
    local digit="${alphabet[$alpha_num]}"
    str="${str}${digit}" 
  done

  echo $str
}

#######################################
# check super user.
# Globals:
#   None
# Arguments:
#   alphabet number
# Outputs:
#   alphabet order of alphabet. 0 => a, 25 => z, 26 => aa ...
# Returns:
#   0 if , non-zero on error occured.
# Example:
#   convert2alpha_list 100 # => 
#######################################
function convert2alpha_list {

  local ten_base_num=$1
  local str
  local i
  for ((i=0;i < ten_base_num;i++)); do
    convert2alpha $i alpha
  done
}



function test_environment {

  MYSQL_DB=
}

function production_environment {

  MYSQL_DB=
  # MUSQL_DB
  # prodcution
}

function test {
  local tmpfile=$(mktemp)
  trap "
    rm ${tmpfile}
    trap - RETURN
  " RETURN
  echo "Hello World" > $tmpfile
  deepl_translate $tmpfile DE


  deepl_translate -r $tmpfile DE
  # local menu=(${@:2:($#-1)})
  local args=(${@:2:($#-1)})
  echo "${args[1]}"
  # $1 "${fArgs}"
}

# test $@
