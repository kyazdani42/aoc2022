#!/usr/bin/env bash

total=0

is_rock() {
  [[ "$1" =~ ^A ]]
}

is_paper() {
  [[ "$1" =~ ^B ]]
}

is_scissors() {
  [[ "$1" =~ ^C ]]
}

process_line() {
  if is_rock $1; then
    if [[ "$1" =~ X$ ]]; then
      total=$(( $total + $ROCK_X ))
    elif [[ "$1" =~ Y$ ]]; then
      total=$(( $total + $ROCK_Y ))
    elif [[ "$1" =~ Z$ ]]; then
      total=$(( $total + $ROCK_Z ))
    fi
  elif is_paper $1; then
    if [[ "$1" =~ X$ ]]; then
      total=$(( $total + $PAPER_X ))
    elif [[ "$1" =~ Y$ ]]; then
      total=$(( $total + $PAPER_Y ))
    elif [[ "$1" =~ Z$ ]]; then
      total=$(( $total + $PAPER_Z ))
    fi
  elif is_scissors $1; then
    if [[ "$1" =~ X$ ]]; then
      total=$(( $total + $SCISSORS_X ))
    elif [[ "$1" =~ Y$ ]]; then
      total=$(( $total + $SCISSORS_Y ))
    elif [[ "$1" =~ Z$ ]]; then
      total=$(( $total + $SCISSORS_Z ))
    fi
  fi
}

ROCK_X=4
ROCK_Y=8
ROCK_Z=3

PAPER_X=1
PAPER_Y=5
PAPER_Z=9

SCISSORS_X=7
SCISSORS_Y=2
SCISSORS_Z=6

while read line; do
  process_line "$line"
done <input

echo "Total with XYZ as type of play: ${total}"

ROCK_X=3
ROCK_Y=4
ROCK_Z=8

PAPER_X=1
PAPER_Y=5
PAPER_Z=9

SCISSORS_X=2
SCISSORS_Y=6
SCISSORS_Z=7

total=0

while read line; do
  process_line "$line"
done <input

echo "Total with XYZ as goal: ${total}"
