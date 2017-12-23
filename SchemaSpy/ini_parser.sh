#!/bin/bash

# $1: INI_FILE
# $2: SECTION
function ini_parser(){
eval $(sed -e 's/[[:space:]]*\=[[:space:]]*/=/g' \
  -e 's/;.*$//' \
  -e 's/[[:space:]]*$//' \
  -e 's/^[[:space:]]*//' \
  -e "s/^\(.*\)=\([^\"']*\)$/\1=\"\2\"/" \
  < $1 \
  | sed -n -e "/^\[$2\]/,/^\s*\[/{/^[^;].*\=.*/p;}")
}

# # usage
# ini_parser sample.ini test
ini_parser db.ini database
echo $db_host
