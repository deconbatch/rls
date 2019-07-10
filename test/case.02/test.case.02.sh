#!/bin/bash

diff_func() {
  ols_out="${result_dir}/ols.out.${i}.txt"
  ols_err="${result_dir}/ols.err.${i}.txt"
  rls_out="${result_dir}/rls.out.${i}.txt"
  rls_err="${result_dir}/rls.err.${i}.txt"
  dif_out="${result_dir}/dif.out.${i}.txt"
  dif_err="${result_dir}/dif.err.${i}.txt"

  ls          ${params[i]} 1> ${ols_out} 2> ${ols_err}
  ${rls_path} ${params[i]} 1> ${rls_out} 2> ${rls_err}

  diff -u0 ${ols_out} ${rls_out} > ${dif_out}
  diff -u0 ${ols_err} ${rls_err} > ${dif_err}
}

params=(
    "-l *"
)

result_dir="dir01/results"
rls_path="../../rls"

original_lang=$LANG
LANG=C
#rm ${result_dir}/*txt
for ((i = 0; i < ${#params[@]}; i++)) {
  diff_func
}
LANG=${original_lang}
