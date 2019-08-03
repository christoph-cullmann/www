---
title: "Privacy and Hugo Themes"
date: 2019-04-07T17:10:00+02:00
draft: false
categories: [www]
tags: [hugo, privacy]
url: /posts/privacy-and-hugo-themes/
---

I use the "Hugo Coder" theme for this page.

After creating the [privacy page (Impressum)](/impressum/), I did take a closer look at the generated HTML code to confirm I didn't miss to state things there.

I thought, given Hugo generates plain static HTML pages, I would be on the safe side.

But unfortunately, the theme I use includes some external resources, like the Google web fonts...

I now patched that out in my [fork](https://github.com/christoph-cullmann/hugo-coder) of the theme and provide local copies on my own server.

The local mirrored files can be found [here](https://github.com/christoph-cullmann/cullmann.io/tree/master/static).

Actually, this shows, for a "normal" user, it is really hard to ensure no privacy violations are on his/her/... website, given you need to control each and every page.

This is already ugly with static pages, like the stuff generated here (and I hope I missed nothing), but with dynamic websites this is...
