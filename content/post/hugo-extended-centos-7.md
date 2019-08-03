---
title: "Hugo Extended on CentOS 7"
date: 2019-04-06T22:55:00+02:00
draft: false
categories: [www]
tags: [hugo, centos]
url: /posts/hugo-extended-centos-7/
---

After first using the Hermit theme, I moved to the Hugo Coder theme to have a nicer front page and menu at the top.

Unfortunately that needs Hugo in the "extended" version.

The binary one can download on https://github.com/gohugoio/hugo/releases doesn't run on CentOS 7, unlike the normal variant you get there (too new libstdc++ needed).

One has to recompile it to get that working.

To make it easier for others, to do so, just:

* install golang + gcc-c++ on your CentOS 7
* download https://github.com/gohugoio/hugo/archive/v0.54.0.tar.gz
* execute in the source directory `go install -tags extended`
* grab the result binary in your ~/go directory

If you need a pre-compiled one, on your own risk, use the one in my git, https://github.com/christoph-cullmann/cullmann.io.
