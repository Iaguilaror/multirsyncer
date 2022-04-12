#!/bin/bash

# parsing args taken from: https://www.baeldung.com/linux/use-command-line-arguments-in-bash-script
while getopts i:d: flag
do
    case "${flag}" in
        i) inputlist=${OPTARG};;
        d) destiny=${OPTARG};;
    esac
done

# message operation
echo "[DEBUG] syncing files in: $inputlist"
echo "[DEBUG] moving into: $destiny"

mkdir -p $destiny \
&& while read ifile
do
  echo "--"
  echo "    [...] syncing $ifile"
  rsync -avP $ifile $destiny
done < $inputlist
