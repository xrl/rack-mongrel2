# rack-mongrel2

This Gem was supposed to be "the only Mongrel2 Rack handler you'll ever need." Unfortunately, its original author hasn't done a lot of work with Mongrel2 or ØMQ, so parts of it made ridiculous assumptions which just didn't work in actual production environments. He also seems to be pretty lazy about fixing obvious bugs which make the Gem flat out unusable, so here's a fork.

# What's Different?

1. I don't care about any of that FFI shit. I use the standard-issue zmq gem and I like it.

2. I don't ever supply any default ØMQ connection specs since there is virtually NO chance that you will ever setup your Mongrel2 instance the same way I setup mine. Especially not if you're running more than one of them and can't keep recycling the same ports for every app you intend to boot.

3. I fixed a longstanding crasher that's been unaddressed for months which was hindering my team's progress.

# Sounds Cool. Gimme.

Add `http://gem.khiltd.com` to your gem sources. Either via `gem source --add` or by throwing it in your Gemfile.

## Copyright

Original project Copyright (c) 2010 Daniel Huckstep. See LICENSE for details.
