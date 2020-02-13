# intelJobs

Scrape job descriptions from intel careers website for easy keyword searching

## Dependencies

Uses [xidel](http://www.videlibri.de/xidel.html)

## Usage

`Grab.sh` is the main script for downloading text for all the jobs on a specific page.

Once you have jobs downloaded, `Keyword.sh` can be used to grep the text of downloaded jobs. It also checks if a job is no longer listed online.

`Folsom.sh` and `Oregon.sh` are helper scripts to download lots of jobs from particular locations.

`Where.sh` is used to check the location of a job. I used this because I accidentally downloaded a bunch of jobs in Singapore (location includes "OR" - whoops).
