#! /usr/bin/env bash

for file in $(find jobs -type f | xargs grep -il "$1") ; do
	match=$(basename $file)
	id="${match%.*}"

	echo -n "https://jobs.intel.com/ShowJob/Id/$id"
	echo -n " - ("
	grep -oE 'JR[0-9]+' $file | tr -d '\n'
	echo -n ") "
	title=$(xidel --silent "https://jobs.intel.com/ShowJob/Id/$id" --css '.jobdescriptiontbl h3')
	if [ -z "$title" ] ; then
		echo -e "$txtred[[Unlisted]]$txtrst"
	else
		echo -e "$bldwht$title$txtrst ($(Where.sh $id))"
	fi

done

