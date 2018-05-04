#! /usr/bin/env bash


url="$1"

if [ -z "$url" ]; then
	echo 'usage: Grab.sh <url>'
	exit 1
fi

mkdir -p 'jobs'

for job in $(wget "$url" --quiet --output-document - | grep -Po '/ShowJob/Id/\K[0-9]+') ; do

	if [ ! -f "jobs/$job.txt" ] ; then
		xidel --silent "https://jobs.intel.com/ShowJob/Id/$job" --css '.jobdescriptiontbl' > "jobs/$job.txt"

		echo -n "https://jobs.intel.com/ShowJob/Id/$job"
		echo -n " - ("
		grep -oE 'JR[0-9]+' "jobs/$job.txt" | tr -d '\n'
		echo -n ") "
		xidel --silent "https://jobs.intel.com/ShowJob/Id/$job" --css '.jobdescriptiontbl h3'
	fi
done

