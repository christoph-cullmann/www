---
title: "Plasma & Kate on Wayland in 2025"
date: 2025-07-20T19:00:00+02:00
draft: false
categories: [kde]
tags: [kde]
url: /posts/plasma-kate-wayland-2025/
author: "Christoph Cullmann"
---

This is an update of my [Plasma & Kate on Wayland end of 2021 post](/posts/plasma-kate-wayland-2021/) from close to 4 years ago.

## Wayland, what?

Since years (or let's say a decade now) [Wayland](https://wayland.freedesktop.org/) based compositors are promoted as the successors to the venerable [X.org](https://www.x.org) X11 display server.

If you want to have some more high level overview about what is different to good old X11 see the [Wayland Architecture](https://wayland.freedesktop.org/architecture.html) overview.

## But my Xeyes...

And yes, X11 will not just vanish in the next years and [Xwayland](https://wayland.freedesktop.org/docs/html/ch05.html) will allow to run legacy applications for even longer without relying on the full low-level X11 stack.

But poor Xeyes will not be able to watch Wayland windows, evil security, I want my global key logger in no time!

## My experience in 2025

Since my [last post in 2021](/posts/plasma-kate-wayland-2021/) I use Wayland more or less exclusive on all my private machines.

The latest newcomer to that is a M2 Macbook Air, even there it works just fine for me in general.
For more details, here is [my NixOS configuration](https://git.babylon2k.com/cullmann/nixos/src/branch/master/zeta) for that machine, many thanks to the [Asahi Linux team](https://asahilinux.org/) to make that feasible!

At work we use [Arch Linux](https://archlinux.org) since some time and there Waylands works just fine for my needs, too.

I must confess I stay away from NVIDIA hardware and the AMD, Intel & Apple M2 GPUs I use work nicely with the open source drivers.
Therefore, if you are a NVIDIA user, your mileage might vary.

Same if you are stuck on some older distribution, but as said, X11 is not gone.
Before my 2021 switch I did keep using X11 due to driver issues, too, and I think that will still be feasible for years.

For day to day tasks I face no bugs that block me on either NixOS or Arch Linux.

For Kate itself, we had some persistent issues with bad parents of popups, that should now be fixed in the latest Frameworks 6 and some upcoming Qt 6.9.2 or higher patch release.
That should remove the last logging spam on the terminal about Wayland issues like seen below.

> qt.qpa.wayland: Creating a popup with a parent, QWidgetWindow(0x559ddf4cf3c0, name="MainWindow#1Window") which does not match the current topmost grabbing popup, QWidgetWindow(0x559de00644b0, name="goWindow") With some shell surface protocols, this is not allowed.
> The wayland QPA plugin is currently handling it by setting the parent to the topmost grabbing popup.
> Note, however, that this may cause positioning errors and popups closing unxpectedly.
> Please fix the transient parent of the popup.

The stuff did in principle work before, but that output still was unsettling and in rare cases could lead to totally misplaced popups or other issues with them.

One thing that I myself underestimated a lot in the past is, that Wayland is just a different thing than X11.
It is a totally different platform in many aspects and just because stuff works as wanted on X11, if they are very low level, they might not work the same way on Wayland.
Thankfully a lot of people helped to fix the issues we had!

## All done?

No, naturally not.
One could ask: but a lot of people worked on that a decade?
How can that be?

Wayland is as said above really different to X11 in design (for good reasons, we no longer live in the 80ties and requirements have changed), it is expected that this will take time given the amount of code we have.

The [currently known significant issues](https://community.kde.org/Plasma/Wayland_Known_Significant_Issues) that still not work looks reasonable small to me.
Naturally that might be different for others, one must be transparent that some stuff is working differently now and that some things still just not work (and some never will work by design).

My personal biggest issue I still have with Kate is the missing way to raise my existing windows if I open a new file via the terminal shell.
All works fine if you do that via Dolphin and Co. as I get some activation token, that is at the moment just not feasible via the terminal with the shell.

With virtual desktops we miss some way to pick the right window or decide if we need to open a new one (even if we get a activation token from Dolphin), see [bug 503519](https://bugs.kde.org/show_bug.cgi?id=503519).

## My current KDE Plasma Wayland session

Like in the last post, let's take a look at how my current session looks.

{{< image src="images/plasma-kate-wayland.png" alt="My current KDE Plasma on Wayland session with Kate ;=)" >}}

## Try it out!

I can encourage all to give Wayland a try, if you are on some up-to-date distribution.
To hunt the last bugs, we need more adopters.
That more and more distributions default to Wayland naturally helps in that respect.
But one must manage the expectations, the [currently known issues](https://community.kde.org/Plasma/Wayland_Known_Significant_Issues) will not just disappear over night.

## Help out!

If you encounter issues, please report them as bug reports to the respective upstream projects.
And naturally, any help in fixing them would be welcome, too.
For Kate/KTextEditor beside the above mentioned window activation, I got all stuff that bothered me fixed.
Naturally there will still be things that annoy others, patches welcome, scratch your own itch!

## Feedback

You can provide feedback on the matching [Reddit post](https://www.reddit.com/r/linux/comments/1m4u5y3/plasma_kate_on_wayland_in_2025/).
