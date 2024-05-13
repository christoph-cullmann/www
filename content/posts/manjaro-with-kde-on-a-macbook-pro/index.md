---
title: "Manjaro with KDE on a MacBook Pro"
date: 2020-01-14T21:22:00+02:00
draft: false
categories: [KDE, Kate, macOS]
tags: [KDE, Kate, macOS]
url: /posts/manjaro-with-kde-on-a-macbook-pro.md/
author: "Christoph Cullmann"
---

I bought a MacBook end of 2014.
My initial reason to buy it was to [improve the Kate port](https://kate-editor.org/2015/01/03/kate5-on-mac/) for macOS.
Beside that, I wanted to try if the Apple ecosystem and macOS are really that great and will solve all my issues in life (short answer: no, they aren't, at least not for me).
The HiDPI screen looked nice, too :=)

After some initial "not a lot works", if you don't go the [Homebrew](https://brew.sh/) or [MacPorts](https://www.macports.org/) way, the Kate port improved over the following years.

I learned a lot about standalone non-Linux deployment of applications and macOS specifics in the process.

As a side-effect of my porting efforts, with the help of others, I was able to improve the deployment of [KDE Frameworks](https://api.kde.org/frameworks/index.html) in some ways, e.g. by allowing to bundle more stuff inside [Qt resources](https://doc.qt.io/qt-5/resources.html).

For example the [KSyntaxHighlighting](https://api.kde.org/frameworks/syntax-highlighting/html/index.html) or [KTextEditor](https://api.kde.org/frameworks/ktexteditor/html/index.html) frameworks are now just a library you link, you don't need to deploy any extra data files.
This is a huge improvement, if you want to bundle them with your standalone application.

Unfortunately, my initial hope, that we would get more people contributing to the macOS port (and with this to KTextEditor/Kate/...) didn't really take off.

Beside some minimal help, not a lot happened.

I think my last self-provided bundle update for macOS was in [2016](https://kate-editor.org/2016/06/16/new-katekwrite-bundles-for-mac/).

The binary factory still churns out new builds, you can grab them via the links on our [download page](https://kate-editor.org/get-it/).

I occasionally tried them, but they never got polished in a way like our Windows variants that we now even ship via the [Windows Store](https://www.microsoft.com/store/apps/9NWMW7BB59HW).

Apple doesn't make the world a better place with each update of macOS, see for example the now necessary notarized builds and the effort the cause for e.g. [Krita](https://krita.org/en/item/first-notarized-macos-build-of-krita/)
(and with necessary I mean: you shall do it, otherwise your users are nagged with "do you really want to execute this..." stuff that makes a very bad impression).

In the last years, I used my MacBook more or less just to either grab some stuff from iTunes or do stuff inside my Linux VirtualBox there.

Given I anyways have a proper Windows 10 VM to take care of the Windows development for Kate (yes, Apple, Microsoft allows that officially, you can just buy a license, you can even get some 'free' developer VM images for a fixed time...), I just migrated my seldom used iTunes account to that machine.

With that away, I just installed purely [Manjaro Linux](https://manjaro.org/) on my MacBook last evening, who cares, I anyways don't use macOS at all beside as VirtualBox startup environment.

I searched for some pointers in the internet, in the past I already had some parallel install.
If you search a bit, you will find various hints how to do it.

If people want to do the same as me, a pure Manjaro install without keeping any macOS around, here a minimal how-to for a MacBook Pro Retina 13" (model number MGX82**/A, model id MacBookPro11,1):

* Get the USB installer from their [Manjaro Linux](https://manjaro.org/) homepage, I used the KDE variant ;=)

* Get it on a stick and plug it into your MacBook

* Boot up your MacBook (pressing the ALT key)

* Select the EFI boot option.

* Start the live system, like on any other machine

* If you want to have internet, which is a good idea to e.g. later easily install the Broadcom driver, use your mobile phone with USB-tethering

* Install it normally, I used the "erase my full drive and encrypt it" variant. Be careful, your data is gone afterwards, you got warned!

* Reboot your MacBook, you will boot into your fresh installed Manjaro

* Install the matching Broadcom driver for your kernel, something like "linux54-broadcom-wl"

* Install some fan control like "mbpfan-git" and enable it afterwards with "sudo systemctl enable mbpfan" + "sudo systemctl start mbpfan"

For me this did the job and the stuff is running well enough.
The webcam won't work without additional effort, not that I use it.
No idea if Bluetooth or other stuff like the Thunderbolt ports work, but I never used that even on macOS.

Fortunately the HiDPI support on Linux & Qt & KDE has gone a long way since my initial try 2015 and now, with some scaling of 1.5 or 2, it is all nicely usable ;=)

Given I still have some macOS machines available at work, I might still try out some Kate bundles there from time to time, but my personal life is now macOS free.

