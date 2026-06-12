#!/bin/bash

set -euo pipefail

echo "=== Testing set -u ==="
echo $city

echo "=== Testing set -e ==="
cd /wrong-directory

echo "=== Testing pipefail ==="
cat missing_file.txt | grep hello

echo "Script completed"
