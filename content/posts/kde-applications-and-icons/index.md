---
title: "KDE Applications & Icons"
date: 2024-05-11T20:24:00+02:00
draft: false
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

If I speak about 'KDE Applications' here I talk about applications like Kate, Dolphin, Okular and others like that.

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

## Getting it fixed

Fortunately, just because the status quo is not that nice, it must not stay that way.

We have more or less all needed parts to fix the situation, we did already fix it during [the porting to Windows and macOS](https://kate-editor.org/post/2021/2021-03-07-cross-platform-light-dark-themes-and-icons/).

We just never pushed to get this stuff done on Linux and Co.

How did we solve it there?

* We have the Breeze icon set as Qt resource inside a library and link with that. That makes them a hard build and runtime dependency and easy to deploy.
* We ensure the icon engine we have in our KIconThemes framework is there and used.
* We enforce the Breeze Qt style. (this is not really icon related, but ensures an usable look'n'feel, too)

The first and the last thing are easy to do on Linux and Co., too, even with still allowing the user to override the icon set and style, but still defaulting to Breeze.

The second point is harder, as that requires at the moment a few hacks and is not 100% as good as going the Qt platform theme plugin route we use inside Plasma.

For KDE Frameworks 6.3 we worked to get that done.

See our [meta issue on our GitLab instance](https://invent.kde.org/frameworks/kiconthemes/-/issues/3) covering that topic.

All is not perfect, we will need to get some Qt API to fully do that, but the current state is already usable.

Here a comparison with the state as we have it now in our released software compared to with the state in the current master branch on an Cinnamon desktop.

<center><a href="/posts/kde-applications-and-icons/images/2024-kate-fixed-cinnamon.png" target="_blank"><img width=700 src="/posts/kde-applications-and-icons/images/2024-kate-fixed-cinnamon-small.png"></a></center>

The left side is the current Kate 24.02, the right side the current master build of Kate with master Frameworks.

The hard dependency to the Breeze icon library is done in KIconThemes, if you link to that, you are guaranteed that you have Breeze icons.
You can naturally just link to only the Breeze icon library on your own.

The ensuring that the proper icon engine is done with some new API in KIconThemes that application developers must opt-in for.
The same for the Qt style setup, there we have API in KConfigWidgets.

For Kate the concrete changes can be [found here](https://invent.kde.org/utilities/kate/-/merge_requests/1482).
They are minimal and even remove some platform specific code for the style setup.

Including fallback code for pre 6.3 Frameworks compatibility of the style setting, the basic idea is:

```cpp
#include <KIconTheme>

#define HAVE_STYLE_MANAGER __has_include(<KStyleManager>)
#if HAVE_STYLE_MANAGER
#include <KStyleManager>
#endif

int main(...)
{
    /**
     * trigger initialisation of proper icon theme
     */
#if KICONTHEMES_VERSION >= QT_VERSION_CHECK(6, 3, 0)
    KIconTheme::initTheme();
#endif

    QApplication yourAppInstance(...);

#if HAVE_STYLE_MANAGER
    /**
     * trigger initialisation of proper application style
     */
    KStyleManager::initStyle();
#else
    /**
     * For Windows and macOS: use Breeze if available
     * Of all tested styles that works the best for us
     */
#if defined(Q_OS_MACOS) || defined(Q_OS_WIN)
    QApplication::setStyle(QStringLiteral("breeze"));
#endif
#endif

    ...
}
```

In the long run, once 6.3 is the minimal version the application depends on, this is just:

```cpp
#include <KIconTheme>
#include <KStyleManager>

int main(...)
{
    /**
     * trigger initialisation of proper icon theme
     */
    KIconTheme::initTheme();

    QApplication yourAppInstance(...);

    /**
     * trigger initialisation of proper application style
     */
    KStyleManager::initStyle();

    ...
}
```

At the moment KIconTheme::initTheme() is still a bit hacky until we have proper Qt API, but that is not visible for the API user.

If we get this properly done in our applications, that will not just solve the current issue for running them in other desktop environments.

With that API in use and the now already upstreamed patches, one can build vanilla Frameworks and Kate on Windows and macOS and the icons will just work in the resulting application bundles and you get an usable style out of the box if Breeze is there.

## Help Wanted!

We have now some API to help our applications to be more usable on non-Plasma installations and Windows and macOS.

We still need to make use of it and we need to improve the implementation and upstream to Qt the needed extra API to make it a real 100% replacement to what we do with the Plasma integration plugin.

If you have time to help us, show up on [our meta issue](https://invent.kde.org/frameworks/kiconthemes/-/issues/3).

Not just coding is needed, we for example have still a few icons that [don't recolor well](https://invent.kde.org/frameworks/breeze-icons/-/issues/17), help to fix that is wanted, too.
