#!/bin/bash

greet() {
    echo "Hello, $1!"
}

add() {
    sum=$(( $1 + $2 ))
    echo "Sum is: $sum"
}

greet "Sourav"
add 10 20
