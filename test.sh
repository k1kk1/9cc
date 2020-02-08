#!/bin/bash

# テストスクリプトをデバック
# bash -x test.sh

try(){
    expected="$1"
    input="$2"

    ./9cc "$input" > ./out/tmp.s
	gcc -o ./out/tmp ./out/tmp.s
	./out/tmp
	actual="$?"

    if [ "$actual" = "$expected" ]; then
        echo "$input => $actual"
    else
        echo "$input => $expected expected, but got $actual"
        exit 1
    fi
}

try 0 0
try 42 42
try 21 "5+20-4"
try 41 " 12 + 34 - 5 "
try 47 '5+6*7'
try 15 '5*(9-6)'
try 4 '(3+5)/2'

echo OK