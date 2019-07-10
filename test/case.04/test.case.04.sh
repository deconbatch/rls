#!/bin/bash

diff_func() {
  ols_out="${result_dir}/ols.out.${i}.txt"
  ols_err="${result_dir}/ols.err.${i}.txt"
  rls_out="${result_dir}/rls.out.${i}.txt"
  rls_err="${result_dir}/rls.err.${i}.txt"
  dif_out="${result_dir}/dif.out.${i}.txt"
  dif_err="${result_dir}/dif.err.${i}.txt"

  echo "${params[i]}" > ${ols_out}
  echo "${params[i]}" > ${ols_err}
  echo "${params[i]}" > ${rls_out}
  echo "${params[i]}" > ${rls_err}

  ls          ${params[i]} 1>> ${ols_out} 2>> ${ols_err}
  ${rls_path} ${params[i]} 1>> ${rls_out} 2>> ${rls_err}

  diff -u0 ${ols_out} ${rls_out} > ${dif_out}
  diff -u0 ${ols_err} ${rls_err} > ${dif_err}
}

params=(
    "-l /dev/tty /dev/sda /run/systemd/initctl/fifo /dev/log /dev/core"
)

result_dir="results"
rls_path="../../rls"

original_lang=$LANG
LANG=C
rm ${result_dir}/*txt
for ((i = 0; i < ${#params[@]}; i++)) {
  diff_func
}
LANG=${original_lang}
