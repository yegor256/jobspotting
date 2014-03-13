We're spotting jobs here. Should be online at [jobspotting.curiost.com](http://jobspotting.curiost.com).

We're spotting these sites (through their APIs):

 * [dice.com](http://www.dice.com): [API](http://www.dice.com/common//content/util/apidoc/jobsearch.html)
 * [jobs.github.com](http://jobs.github.com): [Atom](https://jobs.github.com/positions.atom)
 * [careers.stackoverflow.com](http://careers.stackoverflow.com): [RSS](http://careers.stackoverflow.com/jobs?searchTerm=ruby&location=london)
 * [glassdoor.com](http://www.glassdoor.com): [API](http://www.glassdoor.com/api/index.htm)
 * [craigslist.com](http://www.craigslist.com): [RSS](http://sfbay.craigslist.org/sof/index.rss)
 * [linkedin.com](http://www.linkedin.com): [API](https://developer.linkedin.com/apis#jobs)
 
Every few minutes we check what's new and store every new job in PostgreSQL tables:

 * `area`: PK:`id`, `name`, `sources` (JSON configuration of Ruby objects)
 * `job`: PK:`id`, `area`, `uri`, `office`, `date`, `title`
 * `office`: PK:`id`, `name`

You, as a user, can do two things:

 1. Create new area
 2. View offices in any area

Every area is configured with JSON, for example:

```json
{
  "dice": {
    "country": "US",
    "state": "CA",
    "city": "94040",
    "skill": "java"
  },
  "github": {
    "keyword": "java"
  },
  ...
}
```
