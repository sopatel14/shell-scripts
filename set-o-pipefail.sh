#!/bin/bash

set -o pipefail

cat missing_file.txt | grep hello

echo $?
