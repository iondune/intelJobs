#! /usr/bin/env bash

for match in $(find jobs -type f | xargs grep -il "$1") ; do
	match=$(basename $match)
	id="${match%.*}"

	echo -n "https://jobs.intel.com/ShowJob/Id/$id"
	echo -n " - "
	xidel --silent "https://jobs.intel.com/ShowJob/Id/$id" --css '.jobdescriptiontbl h3'

done

