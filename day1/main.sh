#!/usr/bin/env bash

gcc -Wall main.c -o print_sums

./print_sums | sort -rn | head -n1
./print_sums | sort -rn | head -n3 | awk '{sum+=$1} END {print sum}'
