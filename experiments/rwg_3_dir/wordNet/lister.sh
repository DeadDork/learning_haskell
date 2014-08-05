#!/bin/sh

for f in index.*
do
	gawk '/^[a-z]{3,} /{print gensub(/^([a-z]+).*/, "\\1", 1)}' $f >$(echo $f | sed 's/^index.\([a-z]\{1,\}\)/\1.txt/')
done
