#!/bin/bash

diff_func() {
  echo "test ls ${params[i]}"
  ls          ${params[i]}
  echo "test rls ${params[i]}"
  ${rls_path} ${params[i]}
  echo
}

params=(
    "/boot"
    "/usr"
    "/var"
)

rls_path="../../rls"

original_lang=$LANG
LANG=C
rm ${result_dir}/*txt
for ((i = 0; i < ${#params[@]}; i++)) {
  diff_func
}
LANG=${original_lang}
