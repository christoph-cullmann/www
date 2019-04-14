---
title: "Kate History - KDE 4 Porting"
date: 2019-04-12T23:52:00+02:00
draft: false
categories: [kde, kate, development]
tags: [kde, kate]
---

During my web site upgrade, I reviewed the old stuff I had hosted on my long gone web sites but still archived here locally. An interesting thing I stumbled on are the KDE 3 -> 4 porting screenshots of Kate I saved in 2005.

They actually show pretty nicely how far we have gone since 2005 with our development stack.

The KDE 3 -> 4 transition was a large hassle. It did take weeks of work just to get Kate back into an usable state.

We first started with some trivial KTextEditor container (a mini KWrite) for the porting to get KTextEditor at all doing something. That started out with something that even had no menu or toolbars working:

<p align="center">
    <a href="images/katetest-kde4-20050515-more.png" target="_blank"><img width=500 src="images/katetest-kde4-20050515-more.png"></a>
</p>

This evolved after two days into a kind of working KWrite port (icons still randomly missing):

<p align="center">
    <a href="images/katetest-kde4-20050517.png" target="_blank"><img width=500 src="images/katetest-kde4-20050517.png"></a>
</p>

After the KTextEditor part did work "reasonable", we started with Kate:

<p align="center">
    <a href="images/kate-kde4-20050519.png" target="_blank"><img width=500 src="images/kate-kde4-20050519.png"></a>
</p>

And ended up with an initial ported prototype three days later:

<p align="center">
    <a href="images/kate-kde4-20050522.png" target="_blank"><img width=500 src="images/kate-kde4-20050522.png"></a>
</p>

And after that a long time of actual polishing for KDE 4.0 did start. Kate was actually one of the first ported applications during the KDE 3 -> 4 transition.

The KDE 4 -> KF5 transition was much nicer, even thought the Frameworks split did cost a lot of time and resources. But the actual changes to the application code bases were not that radical.

And where did we end up with this ~14 years later? Actually, just here:

<p align="center">
     <a href="images/kate-kf5-20190412.png" target="_blank"><img width=500 src="images/kate-kf5-20190412.png"></a>
</p>

It is still recognizable the same application, thought I hope some progress is visible :=)
