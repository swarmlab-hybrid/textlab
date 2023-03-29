#/usr/bin/env bash
_mpi()
{
  local commands_number=${DOTHIS_COMPLETION_COMMANDS_NUMBER:-50}
  local IFS=$'\n'
  local suggestions=($(compgen -W "$(cat $1 | sed 's/\t//')" -- "${COMP_WORDS[1]}"))
  local sug=1
  if [ "${#suggestions[@]}" == "$sug" ]; then
    local number="${suggestions[0]/%\ */}"
    COMPREPLY=("$number")
  else
    for i in "${!suggestions[@]}"; do
      suggestions[$i]="$(printf '%*s' "-$COLUMNS"  "${suggestions[$i]}")"
    done

    COMPREPLY=("${suggestions[@]}")
  fi
}
_mpi_completions()
{
  local LAB_files=${LAB_PATH}
  if [ "${#COMP_WORDS[@]}" == "2" ] && [ "${#COMP_WORDS[@]}" != "3"  ]; then
    local file2="/usr/share/swarmlab.io/mpi/commands"
    _mpi "$file2" 1
  fi

  
}
complete -F _mpi_completions swarmlab-mpi

