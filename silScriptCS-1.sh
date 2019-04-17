#!/bin/bash
cat $1 | grep  $2 | echo "silence_count:"$(wc -l)

