#!/bin/bash

show_local() {
    local name="Sourav"
    echo "Inside function: $name"
}

show_global() {
    role="DevOps Engineer"
}

show_local

echo "Outside function: $name"

show_global

echo "Outside function role: $role"
