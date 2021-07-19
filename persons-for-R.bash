#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Usage: $0 FILE"
	exit 1
fi

sed 's/; /\n/g' $1 | sed 's/"//g' | grep -v '^#' | \
	sed 's/\(.*\), \(.*\)/as.person("\2 \1"),/g' | \
	tr -d '\n' | sed 's/,$//g' |
	awk 'BEGIN{print "personList("}{print $0}END{print ")"}'
