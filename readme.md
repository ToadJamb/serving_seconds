[![Build Status](https://travis-ci.org/ToadJamb/serving_seconds.svg?branch=master)](https://travis-ci.org/ToadJamb/serving_seconds)

ServingSeconds
==============

Need to humanize seconds elapsed?
Don't want to include ActiveSupport
or other heavy libraries for such a simple thing?

Use ServingSeconds.

Now serving up humanized seconds without all the side dishes.
No ActiveSupportand no monkey patching of Ruby objects (Time, DateTime. etc).
In fact, there are no runtime dependencies.
Delicious.

It's also thread-safe. Break out the extra forks and dig in.


Install
=======

	$ gem install serving_seconds


Gemfile
=======

	$ gem 'serving_seconds'


Require
=======

	$ require 'serving_seconds'


Examples
========

By default, the following values are returned:

```
ServingSeconds.humanize 60          #=> '1m'
ServingSeconds.humanize 60 * 60     #=> '1h'
ServingSeconds.humanize 5 * 60 * 60 #=> '5h'
```

Precision may be specified to get decimal values:

```
ServingSeconds.humanize 0.3, 1 #=> '0.3s'
ServingSeconds.humanize 90, 1  #=> '1.5m'
ServingSeconds.humanize 90, 3  #=> '1.500m'
```

There is a long format available, as well:

```
secs =   1
mins =  60 * secs
hrs  =  60 * mins
days =  24 * hrs
yrs  = 365 * days

ServingSeconds.humanize 10 * yrs + 3 * days, :long #=> '10 years, 3 days'
ServingSeconds.humanize  8 * yrs + 1 * days, :long #=> '10 years, 1 day'
```
NOTE: Precision does not work with the long format,
as it calculates each interval exactly.
