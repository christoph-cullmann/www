---
title: "Kate & Icons"
date: 2024-05-02T00:36:00+02:00
draft: false
categories: [kde]
tags: [kde, gnome, fdo]
url: /posts/kate-and-icons/
author: "Christoph Cullmann"
resources:
  - name: "featured-image-preview"
    src: "images/fedora-40-workstation.jpg"
---

## How it shall look...

### Linux & BSDs

<center><a href="/posts/kate-on-all-platforms-2024/images/2024-kate-linux-wayland.png" target="_blank"><img width=700 src="/posts/kate-on-all-platforms-2024/images/2024-kate-linux-wayland-small.png"></a></center>

### Windows

<center><a href="/posts/kate-on-all-platforms-2024/images/2024-kate-windows.png" target="_blank"><img width=700 src="/posts/kate-on-all-platforms-2024/images/2024-kate-windows-small.png"></a></center>

### macOS

<center><a href="/posts/kate-on-all-platforms-2024/images/2024-kate-macos.png" target="_blank"><img width=700 src="/posts/kate-on-all-platforms-2024/images/2024-kate-macos-small.png"></a></center>

## State on Fedora 40 Workstation & XFCE Spin...

Screenshots taken from the [GNOME bugtracker](https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/issues/288), copies to not stall their GitLab instance.

<center><a href="/posts/kate-and-icons/images/fedora-40-workstation.jpg" target="_blank"><img width=700 src="/posts/kate-and-icons/images/fedora-40-workstation.jpg"></a></center>

<center><a href="/posts/kate-and-icons/images/fedora-40-xfce.png" target="_blank"><img width=700 src="/posts/kate-and-icons/images/fedora-40-xfce.png"></a></center>

I think that is rather unpleasant and for e.g. the left icon-only border just an unusable insult.

## Why? The Adwaita Icon Theme no longer follows the FDO icon naming spec

There was no information that they want to break away from the icon naming 'the world' does assume (given there is a [spec](https://specifications.freedesktop.org/icon-naming-spec/latest/ar01s04.html)).
And now we have that state for our users there, at least on these spins.

That is not that nice, we did spend a lot of work to get our applications working cross-desktop and even cross-platform and now that...

I feel rather infuriated, finding this before going to sleep, even more after reading the feedback in the [GNOME bugtracker](https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/issues/288) and that this is just closed as 'so be it'.

They added now at least a hint to the README:

[**Private UI icon set for GNOME core apps.**](https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/commit/ad605446a829420b659c7f360333e4309a8f4a55)

Ok, I assume that is then all fine.

No, it is not.

Then please don't install it as FDO icon theme and break all FOSS apps that rely on the naming spec...

If you care for non 'GNOME core apps' to work per default properly on distributions like that, please either get them to fix it (hints are given in the [linked issue](https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/issues/288)) or get the distributions to install a compliant theme.

We can plan to work around this mess in [the future](https://invent.kde.org/frameworks/kiconthemes/-/issues/3) on our side, but that will not un-break the application versions that are now already shipped to our users and non-KDE frameworks based stuff that will just run into the same issues.
