---
title: "KDE & Qt Applications and High DPI Displays with Scaling"
date: 2019-10-03T18:40:00+02:00
draft: false
categories: [kde, qt, development]
tags: [kde, qt]
url: /posts/kde-qt-highdpi-scaling/
author: "Christoph Cullmann"
---

### What is a High DPI Display?

In the past, most displays had (or the OS pretended to have) around [96 PPI](https://en.wikipedia.org/wiki/Dots_per_inch#Computer_monitor_DPI_standards), more or less.

If you differed a bit and had too small/large UI elements, you mostly just resized your default font size a bit and were kind of happy.

In the last years, more and more displays arise that have a much higher PPI values, which allows for e.g. very crisp rendering of text.

I arrived late in that era for my Linux machines by now starting to use two 163 PPI displays.

Just tweaking your fonts doesn't help here, all other things will still be unbearable small, even if you in addition increase e.g. icon sizes.

A solution for this is the current trend to just "scale" your UI by some factor, for my displays some factor of 1.5 leads to the most pleasant sizes.

### How does Qt handle that?

A detailed description on how Qt does try to tackle the challenges of such displays can be found [here](https://doc.qt.io/qt-5/highdpi.html).

More or less the gist of this is:
In your application you work on logical pixels (in most cases) and Qt will do the hard work for you to then paint that in real pixels with the right scaling applied.

In practice, this isn't fully transparent to the programmer.
For example, as soon as you work with QPixmap, you will think a bit about where which pixel variant is used.
You need to be careful to not mix-up the size() of a QPixmap 1:1 with let's say layout/widget sizes in such scaled scenarios, see [here](https://doc.qt.io/qt-5/qpixmap.html#devicePixelRatio).

### Fine, nice, but what does that mean in practice?

Let's take a look at how this works out in practice using the latest stable release of KDE & Qt stuff:

* KDE Plasma 5.16.5
* KDE Applications 19.08.1
* KDE Frameworks 5.62.0
* Qt 5.13.1

My setup for the below experiments are two 163 PPI displays with scale factor 1.5.

I use some [Manjaro Linux](https://manjaro.org/) with open-source AMD drivers for some average middle class card.

The screenshots are taken on my second screen.
I used PNG to avoid that some JPEG artifacts make the real rendering artifacts unclear, bear with the large size.

### Experiments on Kate & Konsole

Let's show the current state with [Kate](https://kate-editor.org) & [Konsole](https://konsole.kde.org), here how Kate 19.08.1 looks if you start it on the second screen with default configuration with COPYING.LIB of ktexteditor.git as file:

<center><a href="/posts/kde-qt-highdpi-scaling/images/kate-19.08.1-hidpi-second-screen.png" target="_blank"><img width=640 src="/posts/kde-qt-highdpi-scaling/images/kate-19.08.1-hidpi-second-screen.png"></a></center>

This looks kind of strange. What you see is actually no split screen, even that is a pure rendering artifacts, actually, the whole Kate windows is more or less one artifacts.

A user reported this in [Bug 411965 - Rendering issue in dual screen hidpi setup](https://bugs.kde.org/show_bug.cgi?id=411965).
With my new setup I was able to reproduce that, on every Kate start :/

The user himself investigated this and came to the same conclusion as me, the culprit is some winId() call in KonsolePart.
As Kate constructs the KonsolePart widget without a parent first and then insert it into a layout, the code inside the part will call [winId()](https://doc.qt.io/qt-5/qwidget.html#winId) on a non-native widget.

This is now fixed and backported to the 19.08 branch.

This means, with 19.08.2, you will have the following experience:

<center><a href="/posts/kde-qt-highdpi-scaling/images/kate-19.08.2-hidpi-second-screen.png" target="_blank"><img width=640 src="/posts/kde-qt-highdpi-scaling/images/kate-19.08.2-hidpi-second-screen.png"></a></center>

This somehow looks more like an actual working application.

For people not able to update, a workaround is to disable both project and terminal plugin in your Kate setup, no ideal solution, but makes Kate at least usable again.

Is now all fine with Kate?
Unfortunately not, lets change my font size a bit and select things:

<center><a href="/posts/kde-qt-highdpi-scaling/images/kate-19.08.2-hidpi-selection.png" target="_blank"><img width=640 src="/posts/kde-qt-highdpi-scaling/images/kate-19.08.2-hidpi-selection.png"></a></center>

I selected both in the text view (KTextEditor) and in the KonsolePart to show the issue is not just a plain "we are too dumb to render things" in KTextEditor.
You get equal artifacts with most of our software :(

I spend some time to trace this issues down in the [QTBUG-66036 - QTextLayout draw() rendering issues with "some" font sizes](https://bugreports.qt.io/browse/QTBUG-66036).

It came up to not being a text related issue at all.

To give a small outline how KTextEditor and Konsole render stuff:

* All things are in pure integer coordinates inside the applications.
* More or less we render some uniform high lines of text.
* Most background/selection coloring is done via [fillRect](https://doc.qt.io/qt-5/qpainter.html#fillRect) with integer coordinates/sizes in both KTextEditor/Konsole.
* KTextEditor paints parts of the text background via [QTextLayout::setFormats](https://doc.qt.io/qt-5/qtextlayout.html#setFormats).
* KTextEditor and Konsole rely in some parts on the clipping to avoid over-painting.

Given none of both rendering "engines" work anywhere with non-integer coordinates and sizes, the artifacts seems to be strange.
They only occur with fractional scaling, e.g. with 1.5, not with e.g 2.0.

During debugging, three major issues that lead to the artifacts came up, I created separate bugs for them, as they are not text rendering related:

#### [QTBUG-78964 - fillRect + Anti-Aliasing + hi-dpi Scaling => missing filled pixels](https://bugreports.qt.io/browse/QTBUG-78964)

If you use fillRect, even for purely integer coordinates and sizes, if the scaling is fractional and you have the render hint "QPainter::Antialiasing" turned on, it will miss to fill one pixel at the border.
For KTextEditor/Konsole mostly at the lower part of the filling.
A workaround for this, now commited for KTextEditor framework and Konsole is to turn the anti-aliasing off for large parts of the rendering.
Only the parts that actually need it, turn if on again, this doesn't affect e.g. the text anti-aliasing.

#### [QTBUG-78962 - setClipRect misbehavior for hi-dpi scaling with QRect overload vs. QRectF overload](https://bugreports.qt.io/browse/QTBUG-78962)

KTextEditor uses setClipRect to avoid overpainting between individual lines. Unfortunately, like fillRect, setClipRect leads to one pixel being clipped away too early for fractional scaling.
A workaround for this is to use the QRectF overload of setClipRect.
Even thought the passed QRectF has the same pure-integer coordinates, this will avoid the clipping errors due to different internal handling.
KTextEditor uses now this workaround.

#### [QTBUG-78963 - Misbehavior of clipping done for ::paintEvent with hi-dpi fractional scaling](https://bugreports.qt.io/browse/QTBUG-78963)

Even after all this fixed, Konsole still draws some artifacts.
Konsole is more relying on paintEvent to clip correctly than KTextEditor.
Unfortunately the internal clipping done for the paintEvent seems to have the same off-by-one rounding issues like the manual setClipRect for QRect instead of QRectF.
As we can't control this clipping region in Konsole, I see no easy workaround, beside more often trigger full widget updates, which are costly.

This leads to this current state of the rendering in the master branch.
I did select + deselect a bit text in the terminal to trigger the paintEvent related clipping failure, you can see a few small one pixel high selection leftovers below the selection area.
You need to play a bit with the scaling factor and font size, too, to trigger the effects, as like all rounding errors, you need specific values to trigger them.

<center><a href="/posts/kde-qt-highdpi-scaling/images/kate-master-hidpi.png" target="_blank"><img width=640 src="/posts/kde-qt-highdpi-scaling/images/kate-master-hidpi.png"></a></center>

I hope the Qt bugs linked above can be fixed in the near future, as I doubt we can add workaround to all the applications affected (nor do we want to) and the clipping issue of the paintEvent, if it really is the reason for the last remaining Konsole artifacts, seems not to be really fixable at all in the application code, beside going away from fine grained repaints.

Here are the matching [KTextEditor](https://bugs.kde.org/show_bug.cgi?id=390451) and [Konsole](https://bugs.kde.org/show_bug.cgi?id=373232) bug report for the above issues.
The relevant Qt bugs are linked there again, too.

### Are that all current issues? I assume not.

I think there are for sure more pitfalls hidden, if you use some fractional scaling and Qt & KDE applications.
Some of our applications are even still horrible broken for any kind of scaling :(

We are open-source software, patches to improve the current situation are very welcome.

Perhaps you are able to fix one of the above Qt bugs, that would be great!

### P.S. Floating point math is hard!

One thing that disturbed me during trying to get rid of the rendering artifacts, is the bit careless choice of scaling factors people use.

I can understand that you want to have things 20% larger, but unfortunately, a factor of 1.2 leads to rounding errors all over the place, as 1.2 is no the nice number it seems to be in the hardware double precision floats we use.

If you want to avoid running in bad artifacts more than needed, please better scale with some factor that is a nicely representable float, like some multiple of 1/16 or 1/32.

For example some scaling with 1.25 will lead to much less issues than 1.2.

For details, just read up about how stuff like 0.1 or 0.2 is represented ;=)

* [Floating Point Arithmetic: Issues and Limitations](https://docs.python.org/3/tutorial/floatingpoint.html)
* [Why 0.1 Does Not Exist In Floating-Point](https://www.exploringbinary.com/why-0-point-1-does-not-exist-in-floating-point/)
* [Binary Fractions](https://floating-point-gui.de/formats/binary/)

You can ignore that advice and scale like you want, but I won't take care of the artifacts that remain for e.g. 1.1 scaling in some corner cases ;=)

### Discussion

Feel free to join the discussion at the [KDE reddit](https://www.reddit.com/r/kde/comments/dct6r1/kde_qt_applications_and_high_dpi_displays_with/).
