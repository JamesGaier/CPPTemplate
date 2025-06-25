#!/bin/bash

BOLD=$(tput bold)
NORMAL=$(tput sgr0)

# arg0 is the return code
print_help() {
  echo ""
  echo "format.sh"
  echo ""
  echo "${BOLD}NAME${NORMAL}"
  echo "    format.sh - A tool for formatting C++ files using clang-format"
  echo ""
  echo "${BOLD}SYNOPSIS${NORMAL}"
  echo "    format.sh [filename | help]"
  echo ""
  echo "${BOLD}DESCRIPTION${NORMAL}"
  echo ""
  echo "${BOLD}filename${NORMAL}"
  echo ""
  echo "The name of the cpp file to be formatted."
  exit $1 
}



if [[ $1 == "help" ]]; then
  print_help 0
fi


EXPECTED_ARGS_DIR=2
EXPECTED_ARGS_FILE=1
if [[ $1 == "-d" && $# == $EXPECTED_ARGS_DIR ]]; then
    clang-format -i -- $2/**.cpp 
elif [[ $# == $EXPECTED_ARGS_FILE ]]; then
    clang-format -i $1
else
  print_help 1
fi

