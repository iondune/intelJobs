#! /usr/bin/env bash


url='https://jobs.intel.com/ListJobs/All/Search/jobtitle/software/country/us/city/folsom/state/ca/'

mkdir -p 'jobs'

for job in $(wget "$url" --quiet --output-document - | grep -Po '/ShowJob/Id/\K[0-9]+') ; do

	if [ ! -f "jobs/$job.html" ] ; then
		echo "new job: $job"
		xidel --silent "https://jobs.intel.com/ShowJob/Id/$job" --css '.jobdescriptiontbl' > "jobs/$job.txt"
	fi
done

