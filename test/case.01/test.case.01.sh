#!/bin/bash

source ../test.common.sh

paths=(
    ""
    "./"
    "../case.01/"
    "test.case.01.sh"
    "dir01/*"
    "/"
    "/boot"
    "/boot /usr"
    "/boot/ /usr/"
)

result_dir="results"
rls_path="../../rls"

original_lang=$LANG
LANG=C
rm ${result_dir}/*txt
for ((i = 0; i < ${#paths[@]}; i++)) {
  options_func
}
LANG=${original_lang}
