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
    src: "images/2024-kate-linux-wayland.png"
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

## Current State of Icons per Desktop or Platform

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

### Haiku

After covering Plasma and the two large closed-source desktop operating systems, as a small excursion, look how Kate (the KF5 based version) looks if installed on [Haiku](https://www.haiku-os.org/) with the package they provide.

<center><a href="/posts/kde-applications-and-icons/images/2024-kate-haiku.png" target="_blank"><img width=700 src="/posts/kde-applications-and-icons/images/2024-kate-haiku-small.png"></a></center>

Kate looks ok, system icons intermixed with Breeze as fallback icons.

### GNOME

For testing this, I installed the latest Fedora Workstation in a VM.
I have done no user configuration beside what the installer and initial setup wizard asked and then just installed the Kate package.
The shell was even helpful to ask to do that after you just tried to start the not installed Kate.

<center><a href="/posts/kde-applications-and-icons/images/2024-kate-fedora-gnome.png" target="_blank"><img width=700 src="/posts/kde-applications-and-icons/images/2024-kate-fedora-gnome-small.png"></a></center>

Most icons not there, not that nice.
For details about that read [this post](/posts/kate-and-icons/), we don't need to re-iterate this again.

If you think: that is just Kate, let us just try Okular.

<center><a href="/posts/kde-applications-and-icons/images/2024-okular-fedora-gnome.png" target="_blank"><img width=700 src="/posts/kde-applications-and-icons/images/2024-okular-fedora-gnome-small.png"></a></center>

One thing that can be at least solved easily is that the icons are gone, we just install the Breeze icon set as package.

<center><a href="/posts/kde-applications-and-icons/images/2024-kate-and-okular-with-breeze-fedora-gnome.png" target="_blank"><img width=700 src="/posts/kde-applications-and-icons/images/2024-kate-and-okular-with-breeze-fedora-gnome-small.png"></a></center>

Looks ok, system icons intermixed with Breeze as fallback icons just like on Haiku.
Not stylish but usable.

I was unable to trigger Kate or Okular to adjust to the dark mode GNOME provides, therefore I can not test if we end up with black on black icons there, but it is likely, as the fallback is just Breeze.

### MATE

Kate and Dolphin 24.02 on MATE with dark mode on NixOS, normal system packages, Breeze icons is installed.

<center><a href="/posts/kde-applications-and-icons/images/2024-kate-and-dolphin-mate.png" target="_blank"><img width=700 src="/posts/kde-applications-and-icons/images/2024-kate-and-dolphin-mate-small.png"></a></center>

System icons intermixed with Breeze as fallback icons, looks not that nice.
Breeze icons not readable, as recoloring is not working.

### Xfce

Kate and Dolphin 24.02 on Xfce with dark mode on NixOS, normal system packages, Breeze icons is installed.

<center><a href="/posts/kde-applications-and-icons/images/2024-kate-and-dolphin-xfce.png" target="_blank"><img width=700 src="/posts/kde-applications-and-icons/images/2024-kate-and-dolphin-xfce-small.png"></a></center>

Same mix and unreadable state as on MATE.

### Enlightenment

Kate 24.02 on Enlightenment with dark mode on NixOS, normal system packages, Breeze icons is installed.

<center><a href="/posts/kde-applications-and-icons/images/2024-kate-enlightenment.png" target="_blank"><img width=700 src="/posts/kde-applications-and-icons/images/2024-kate-enlightenment-small.png"></a></center>

Just unreadable icons, beside out own Git icon and the few colored ones.

## Summary: What's up with Icons today

The icons in KDE applications do look perfect on KDE Plasma.
That should be no real surprise as many people working on these applications will test them there and KDE Frameworks and Qt are well tested on Plasma, too.

The icons look fine on Windows and macOS, too, at least for applications that got properly ported, but only thanks to patches we do in Craft.
If you just grab e.g. Kate's and the needed frameworks sources from our normal repositories, you don't get that.

If the maintainers of the port for some OS do care, like the Haiku people, KDE applications can look fine there.

On other desktop environments it doesn't look that great out of the box.

Unlike for the other operating systems, there the same packages without extra patches are running.

Whereas that works perfect on Plasma, we rely too much that the desktop environment running provides an icon set that has a similar coverage and naming as Breeze. As we don't hard depend on the Breeze icons for our applications, it can even happen that just no fitting icons are there per default.

Even if that can be solved with some better package dependencies, you still end up with a patchwork look and without a Qt platform theme plugin that handles the needed recoloring to make dark mode feasible.





## Feedback
