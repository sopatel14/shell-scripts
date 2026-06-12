#!/bin/bash

set -e

mkdir /tmp/devops-test || echo "Directory already exists"

cd /tmp/devops-test123 || echo "Failed to enter directory"

touch test.txt || echo "Failed to create file"

echo "Script completed successfully"
