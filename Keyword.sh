#! /usr/bin/env bash

for match in $(find jobs -type f | xargs grep -il "$1") ; do
	match=$(basename $match)
	id="${match%.*}"

	echo "https://jobs.intel.com/ShowJob/Id/$id"

done

