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

All Unix like systems with either X11 or Wayland are well supported since ever.

Linux with X11 and now Wayland is for a long time the primary system on that Kate work happens.

Over the years it was (like most of the KDE applications) ported to the most BSD variants.

Be it some mainstream Linux distribution like Fedora or a niche one like NixOS, Kate is available as binary package.
You love BSD?
FreeBSD or OpenBSD, you can get a Kate package via your normal package system.

And in the normal case, you can just build it from source on your own, all needed patches should be in our repositories upstream.
If that is not the case for your system, please help to upstream them.

Below the current state of the master branch compiled on NixOS unstable with Wayland.

<center><a href="/posts/kate-on-all-platforms-2024/images/2024-kate-linux-wayland.png" target="_blank"><img width=700 src="/posts/kate-on-all-platforms-2024/images/2024-kate-linux-wayland-small.png"></a></center>

## Windows

Since several years there are activities in the KDE community to provide our libraries and applications for Windows.

Even if that is a non-free platform, we can reach out to new users and developers that might later be then even interested to switch a full open platform.

Progress is slow, but steady.
We have some applications in the official Windows Store (including Kate) and nightly build for more of them.
With reasonable effort you can develop Kate on Windows with Craft.

Below the current state of the master branch running on Windows 11 inside VirtualBox.

<center><a href="/posts/kate-on-all-platforms-2024/images/2024-kate-windows.png" target="_blank"><img width=700 src="/posts/kate-on-all-platforms-2024/images/2024-kate-windows-small.png"></a></center>

## macOS

Beside Windows, the major other non-free platform Kate tries to support is macOS.

We have nighly build available for that and you can, like on Windows, develop Kate with the help of Craft.

Below the current state of the master branch running native on my M2 ARM Mac Mini.

<center><a href="/posts/kate-on-all-platforms-2024/images/2024-kate-macos.png" target="_blank"><img width=700 src="/posts/kate-on-all-platforms-2024/images/2024-kate-macos-small.png"></a></center>

## Others

Naturally there are more operating systems out there then mentioned above.

Beside the mobile ones like Android and iOS that are not that interesting for Kate, many other small open desktop operating systems exist.

Even if the Kate team itself doesn't put active work it them, that doesn't mean Kate can't run there.

Without any active work on our side, for example a Kate port for Haiku was done.
Some one-liner patches for that got even upstreamed.

If you work on some port of our stuff and need to upstream stuff, please contact us.
Even if you work on a non-mainstream system, as long as the patches are not too intrusive, we are interested to have them.

## Help us!

Naturally the most of our developers are working on the Linux or some BSD.

That means the other systems are always in need of more people to help out, both on the programming and testing side.

For Kate, testing should be easy, grab a nighly build for Windows or macOS for example.
