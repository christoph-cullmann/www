---
title: "Kate on all Platforms - 2024"
date: 2024-04-14T19:25:00+02:00
draft: false
categories: [kde]
tags: [kde]
url: /posts/kate-on-all-platforms-2024/
author: "Christoph Cullmann"
---

## Unix like systems with X11 or Wayland

All [Unix like systems](https://en.wikipedia.org/wiki/Unix) with either [X11](https://en.wikipedia.org/wiki/X_Window_System) or [Wayland](https://en.wikipedia.org/wiki/Wayland_(protocol)) are well supported since ever.

Linux with X11 and now Wayland is for a long time the primary system on that Kate work happens.

Over the years it was, like most of the [KDE applications](https://apps.kde.org/), ported to various [BSD](https://en.wikipedia.org/wiki/Berkeley_Software_Distribution) variants.

Be it some mainstream Linux distribution like [Fedora](https://fedoraproject.org/) or a niche one like [NixOS](http://nixos.org), Kate is available as binary package.
You love BSD?
From [FreeBSD](https://freebsd.org) to [OpenBSD](https://openbsd.org), you can get a Kate package via your normal package system.

And in the normal case, you can just build it from source on your own, all needed patches should be in our repositories upstream.
If that is not the case for your system, please help to upstream them.

Below the current state of the master branch compiled on NixOS unstable with Wayland.

<center><a href="/posts/kate-on-all-platforms-2024/images/2024-kate-linux-wayland.png" target="_blank"><img width=700 src="/posts/kate-on-all-platforms-2024/images/2024-kate-linux-wayland-small.png"></a></center>

How to compile Kate on your own on a Unix like system and start to help to develop it can be found out [here](https://kate-editor.org/build-it/).

## Windows

Since several years there are activities in the KDE community to provide our libraries and applications for [Windows](https://en.wikipedia.org/wiki/Microsoft_Windows).

Even if that is a non-free platform, we can reach out to new users and developers that might later be then even interested to switch a full open platform.

Progress is slow, but steady.
We have Kate and some other applications in the official [Windows Store](https://apps.microsoft.com/search/publisher?name=KDE+e.V.) and nightly build for more of them.
With reasonable effort you can develop Kate on Windows with [Craft](https://community.kde.org/Get_Involved/development/Windows).

Below the current state of the master branch running on Windows 11 inside VirtualBox.

<center><a href="/posts/kate-on-all-platforms-2024/images/2024-kate-windows.png" target="_blank"><img width=700 src="/posts/kate-on-all-platforms-2024/images/2024-kate-windows-small.png"></a></center>

If you like to try that, use the nighly installer linked on the [Kate website](https://kate-editor.org/get-it/).

## macOS

Beside Windows, the major other non-free platform Kate tries to support is [macOS](https://en.wikipedia.org/wiki/MacOS).

We have nighly build available for that and you can, like on Windows, develop Kate with the help of [Craft](https://community.kde.org/Get_Involved/development/Mac).

Below the current state of the master branch running native on my M2 ARM Mac Mini.

<center><a href="/posts/kate-on-all-platforms-2024/images/2024-kate-macos.png" target="_blank"><img width=700 src="/posts/kate-on-all-platforms-2024/images/2024-kate-macos-small.png"></a></center>

Same as for Windows, if you like to try that, use the nighly installer for either ARM or Intel Macs linked on the [Kate website](https://kate-editor.org/get-it/).

## Other Platforms

Naturally there are more than the above mentioned operating systems around.

Beside the mobile ones like [Android](https://en.wikipedia.org/wiki/Android_(operating_system)) and [iOS](https://en.wikipedia.org/wiki/IOS) that are not that interesting for Kate, many other desktop operating systems exist.

Even if the Kate team itself doesn't put active work it them, that doesn't mean Kate can't run there.

Without any active work on our side, for example a Kate port for [Haiku](https://www.haiku-os.org/) was done.
Some one-liner patches for that got even upstreamed.

If you work on some port of our stuff and need to upstream stuff, please contact us.
Even if you work on a non-mainstream system, as long as the patches are not too intrusive, we are interested to have them.

## Help us!

Naturally the most of our developers are working on the Linux or some BSD.

That means the other systems are always in need of more people to help out, both on the programming and testing side.

For Kate, testing should be easy, grab a nighly build for Windows or macOS on the [Kate website](https://kate-editor.org/get-it/).
Or even better, get [Craft](https://community.kde.org/Craft) running, that will make it easier to contribute, too.

One recent topic that needs love is the removal of [DBus](https://en.wikipedia.org/wiki/D-Bus) for Windows/macOS/Android and other systems that don't use it normally.

If you are up to help with that, [here](https://invent.kde.org/packaging/craft-blueprints-kde/-/issues/17) that is coordinated.
The current state is already sufficient that the nightly builds of Kate no longer hang on e.g. macOS, but still some frameworks like KIO will need more work.

Just don't get that wrong, DBus is great on the Linux or BSD systems that use it natively, but it is a pain on systems that have no notion of DBus and leads there to hangs or the spawning of unwanted processes.
Beside that, the usefulness is low there, as there are no services on the bus to communicate with anyways.
