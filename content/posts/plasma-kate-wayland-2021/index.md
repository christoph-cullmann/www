---
title: "Plasma & Kate on Wayland end of 2021"
date: 2021-12-18T19:25:00+02:00
draft: false
categories: [kde]
tags: [kde]
url: /posts/plasma-kate-wayland-2021/
author: "Christoph Cullmann"
resources:
  - name: "featured-image-preview"
    src: "images/plasma-kate-diablo-wayland-small.webp"
---

## Wayland, the future after X11

Since years [Wayland](https://wayland.freedesktop.org/) based compositors are promoted as the successors to the venerable [X.org](https://www.x.org) X11 display server.

In the embedded space it seems Wayland already has made a lot of progress and some distributions start to use it per default, too.

## My experience of the past years

I tried Wayland over the last few years multiple times, but I most often needed to go back to X11 due to random crashes/displaying issues/... (independent of the compositor, I tried a few).
I just had always bad luck with the drivers and Wayland.
On top of that came issues in the remaining stack, too.

Unfortunately, as long as my setup didn't run Wayland at all in any stable way, I didn't really spend a lot of time to actually debug/fix issues even in Kate or KTextEditor.
It's just easier to scratch your own itch then to invest time in stuff you not use yourself at all.

## My experience end of 2021

Two months ago, I tried Wayland once more on my [Arch Linux](https://archlinux.org) machine after some short journey to FreeBSD ;)

And great, it worked out of the box.
Not random crashing of the compositor, no strange fractals on my second screen, all fine.

Now that I can use KDE Plasma & Kate on my normal machine on Wayland every day, I started to get more drive to take a look at remaining Wayland issues.

Aleix Pol Gonzalez & David Edmundson did a fantastic job to help out with remaining issues.

Naturally, not all is perfect for Kate on Wayland, e.g. you still get with each start some

> qt.qpa.wayland: Wayland does not support QWindow::requestActivate()

indicating not all kinds of window activation work as intended at the moment.

But the 21.12 release of Kate should at least have the most obvious issues fixed.

I use now the KDE Plasma Wayland session as my daily driver since two months without any large issues.
I not once had a compositor crash nor any strange displaying issues.

As mentioned above, still small issues remain to be fixed for Kate (and for sure for other applications, too).

But beside Chromium & Wine (even sandboxed as extra user) that still run via XWayland all other parts run native.

Thanks to all people that worked on this to make it happen.
I really was impressed after I gave Wayland a try again how well all parts nowadays work together.
Let's continue to improve that in the next years even more!

## My current KDE Plasma on Wayland session ;=)

Even [Wine](https://www.winehq.org/) based gaming in parallel to coding is possible, awesome!

<center><a href="/posts/plasma-kate-wayland-2021/images/plasma-kate-diablo-wayland.webp" target="_blank"><img width=700 src="/posts/plasma-kate-wayland-2021/images/plasma-kate-diablo-wayland-small.webp"></a></center>

## Try it out!

I can encourage all to give Wayland a try, if you are on some up-to-date distribution like Arch Linux.
At least on my mid-class AMD graphics card Wayland works flawless with the open-source driver.
Naturally the experience can differ for other setups, like it did for me in the past.

## Help out!

If you encounter issues, please report them as bug reports to the respective upstream projects.
And naturally, any help in fixing them would be welcome, too.
For Kate/KTextEditor I might be able to at least reproduce and try to fix them now myself, given I use it now daily, thought other projects might rely more on external contributors to get the rough edges fledged out.

## Feedback

You can provide feedback on the matching [Reddit post](https://www.reddit.com/r/kde/comments/rjdgu5/kde_plasma_kate_on_wayland_end_of_2021/).
