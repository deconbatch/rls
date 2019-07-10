#!/bin/bash

diff_func() {
  ols_out="${result_dir}/ols.out.${options}.${i}.txt"
  ols_err="${result_dir}/ols.err.${options}.${i}.txt"
  rls_out="${result_dir}/rls.out.${options}.${i}.txt"
  rls_err="${result_dir}/rls.err.${options}.${i}.txt"
  dif_out="${result_dir}/dif.out.${options}.${i}.txt"
  dif_err="${result_dir}/dif.err.${options}.${i}.txt"

  echo "${options} ${paths[i]}" > ${ols_out}
  echo "${options} ${paths[i]}" > ${ols_err}
  echo "${options} ${paths[i]}" > ${rls_out}
  echo "${options} ${paths[i]}" > ${rls_err}

  ls          ${options} ${paths[i]} 1>> ${ols_out} 2>> ${ols_err}
  ${rls_path} ${options} ${paths[i]} 1>> ${rls_out} 2>> ${rls_err}

  diff -u0 ${ols_out} ${rls_out} > ${dif_out}
  diff -u0 ${ols_err} ${rls_err} > ${dif_err}
}

options_func() {
  # no option
  options=""	
  diff_func

  # -a
  options="-a"	
  diff_func

  # -r
  options="-r"	
  diff_func

  # -l
  options="-l"	
  diff_func

}
