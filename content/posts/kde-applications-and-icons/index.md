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

Let's start with looking at what I mean with KDE applications and what the current state is, up to KDE Frameworks 6.2 and current KDE Gear 24.04.
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

### KDE Plasma (on Linux/BSD with Wayland/X11)

If you just aim to run on the KDE Plasma desktop with your Qt and KDE Frameworks based application, all is fine with icons, there is no problem.

The KDE project did their job, at least for Kate I never did have any issues with icons on Plasma.


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

## Feedback

You can provide feedback on the matching [KDE Social](https://lemmy.kde.social/post/1212069), [reddit](https://www.reddit.com/r/linux/comments/1chzmya/kde_kate_editor_icons_or_how_fedora_40_with_the/) or [Hacker News](https://news.ycombinator.com/item?id=40230558) post.
