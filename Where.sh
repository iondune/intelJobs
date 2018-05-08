#! /usr/bin/env bash



job="$1"

if [ -z "$job" ]; then
	echo 'usage: Where.sh <job_id>'
	exit 1
fi

filename="jobs/$job.txt"

if [ ! -f "$filename" ]; then
	echo "could not find job: $job"
	exit 2
fi

if grep --silent 'Folsom' "$filename" ; then
	echo -e "${txtylw}Folsom${txtrst}"
	exit 0
fi

if grep --silent 'Hillsboro' "$filename" ; then
	echo -e "${txtgrn}Hillsboro${txtrst}"
	exit 0
fi

if grep --silent 'Singapore' "$filename" ; then
	echo -e "${txtcyn}Singapore${txtrst}"
	exit 0
fi

echo -e "${txtred}Unknown${txtrst}"

