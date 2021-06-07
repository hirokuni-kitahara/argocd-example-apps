#!/bin/bash

files=$(find . -type f -name \*.yaml)

IFS=$'\n'
out=""
for fpath in $files
do
  yaml=$(cat $fpath | sed 's/IMAGE_PLACEHOLDER/gcr.io\/heptio-images\/ks-guestbook-demo:0.1/g')
  out=$(echo -e "$out\n$yaml\n---\n")
done
out=$(echo -e "$out" | sed '$d')
echo -e "$out"
