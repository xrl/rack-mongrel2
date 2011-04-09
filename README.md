# khi-rack-mongrel2

The rack-mongrel2 gem was supposed to be "the only Mongrel2 Rack handler you'll ever need." Unfortunately, its original author hasn't done a lot of work with Mongrel2 or ØMQ, so parts of it made assumptions which just didn't work in actual production environments. He also seems to be pretty lazy about fixing obvious bugs which make the gem flat out unusable, and I've got work to do, so here's a fork.

# What's So Great About Yours?

1. I don't care about any of that Ruby hippie FFI shit. I use the standard-issue hand-compiled zmq gem and I like it. If you can't build it on your OS, you probably shouldn't be serving web pages from it.

2. I don't ever supply any default ØMQ connection specs since there is virtually NO chance that you will ever setup your Mongrel2 instance the same way I setup mine. Especially not if you're running more than one of them and can't keep recycling the same ports for every app you intend to boot. This does make the setup code look more like actual code than magic unicorn farts, so seeing it will probably drive some angry Rails teen to lock himself in a Peet's bathroom for a week to sob uncontrollably while chanting "D.R.Y." and jerking off to the Kid Robot catalog he carries around in the $300 hardshell backpack his mom bought him to protect his MacBook Pro and Hario ceramic burr grinder on the mean streets of SoMa. I consider this my fork's greatest feature. 

3. I fixed a really stupid longstanding crasher that's been unaddressed for months which was hindering my team's progress.

# Sounds Cool. Gimme.

Add `http://gem.khiltd.com` to your gem sources--either via `gem source --add` or by throwing it in your Gemfile. Then just `gem install khi-rack-mongrel2` and get rid of any potentially conflicting versions you might have previously installed.

# You Sound Like A Real Jerk

So don't give me one of your Zazzle cards.

## Copyright

Original project Copyright (c) 2010 Daniel Huckstep. See LICENSE for details.

This divergent version Copyright © 2011 KHI Ltd. Co., LLC. 
