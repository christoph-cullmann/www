---
title: "KDE Applications & Icons"
date: 2024-05-11T00:36:00+02:00
draft: true
categories: [kde]
tags: [kde]
url: /posts/kde-applications-and-icons/
author: "Christoph Cullmann"
resources:
  - name: "featured-image-preview"
    src: "images/fedora-40-workstation.jpg"
---

In this rather lengthy post I talk a bit about the current issues with icons for the KDE applications I work on or use.

Let's start with looking at what I mean with KDE applications and what the current state is, up to KDE Frameworks 6.2 and current KDE Gear 24.02.
Then let's see what will be improved in future releases.

## What do I mean with 'KDE Applications'

If I speak about 'KDE Applications' here I talk about applications like Kate, Konsole, Okular and others like that.

This means applications developed with Qt and KDE Frameworks that integrate well with the KDE Plasma desktop but are not restricted to it.

Many of this applications not just aim to work well on Linux & BSD or other open source operating systems but are ported and working well on the rather different Windows and macOS desktop. Some even are successful since years in the official Windows Store.

The above applications are part of the KDE Gear releases, but the described issues and solutions naturally are not restricted to stuff released with that.

What most of these applications have in common is that they rely on rather large parts of our Frameworks.
With that they depend at least indirectly on an icon set that covers large parts of what our default icon set Breeze provides.
Even if you use no icons from that icon set yourself in your application, just using the standard actions or many widgets/dialogs from Frameworks will rely on some subset of Breeze.

## The great Divider, your Desktop or Platform

When talking about the current situation of icons that depends largely on the desktop or platform you are running the KDE application on.

Let's take a look at some (I for sure miss some that are common or loved, that doesn't mean I disregard them, I just want to limit the scope).

### KDE Plasma on Linux/BSD with Wayland/X11

If you just aim to run on the KDE Plasma desktop with your Qt and KDE Frameworks based application, all is fine with icons, there is no problem.

The KDE project did their job, at least for Kate I never did have any issues with icons on Plasma.

Below a screenshot of Kate 24.02 running on Plasma 6. All icons are there, they are properly re-colored for the dark theme, too, including not just the used Breeze icons but for example the small Git icons in the left sidebar that Kate has bundled.

<center><a href="/posts/kde-applications-and-icons/images/2024-kate-linux-wayland.png" target="_blank"><img width=700 src="/posts/kde-applications-and-icons/images/2024-kate-linux-wayland-small.png"></a></center>

This is the vanilla state each user will get if Kate is installed on Plasma (and the dark theme is used).
There are no patches done during building to achieve that nor is there any extra user configuration necessary.

### Microsoft Windows

If you run Kate on Windows, the icon situation is good, too, if you use our Windows Store variant or get at build done via Craft.

See below what the current nightly of Kate looks like in some Windows 11 VM (I just started it from the unpacked ZIP, no setup needed).

<center><a href="/posts/kde-applications-and-icons/images/2024-kate-windows.png" target="_blank"><img width=700 src="/posts/kde-applications-and-icons/images/2024-kate-windows-small.png"></a></center>

In the Craft build descriptions we do some patches to ensure the Breeze icons are bundled as library and the application links with that.
In addition we ensure with some more patching that our own icon engine is used to allow for the proper recoloring.

If you don't do that patching you will end up with close to no icons or for dark theme black on black icons.

### Apple's macOS

The situation on macOS is the same as on Windows.

If you go with a Craft build of Kate, you will end up with something like below.

<center><a href="/posts/kde-applications-and-icons/images/2024-kate-macos.png" target="_blank"><img width=700 src="/posts/kde-applications-and-icons/images/2024-kate-macos-small.png"></a></center>

All icons are there and even application provided icons like our Git one are properly recolored.

Without the Craft patches Kate has more or less no icons like on Windows.

## Feedback
