#!/bin/bash

source ../test.common.sh

paths=(
    "/"
    "/bin/Xorg"
    "/bin/write"
    "./dir.not.executable"
    "dir.not.executable/file01"
    "dir.not.readable/"
    "no.such.file"
    "no.such.dir/"
    "test.case.03.sh/"
    "the.not.exist /root/not.exist not.exist test.case.03.sh/ /root /root/temp test.case.03.sh"
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
