#!/usr/bin/env bash

files="$(find . -type f -name "*.backup")"

for file in $files; do
	# new_name="${file#*.backup}"
	new_file="${file%%.backup}"
	echo "Move \"$file\" to \"$new_file\""
	mv $file $new_file
done
