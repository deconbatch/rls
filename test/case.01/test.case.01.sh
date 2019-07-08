#!/bin/bash

source ../test.common.sh

paths=(
    "./"
    "rx"
    "rx/"
)

result_dir="results"
rls_path="../../rls"

for ((i = 0; i < ${#paths[@]}; i++)) {
  options_func
}
