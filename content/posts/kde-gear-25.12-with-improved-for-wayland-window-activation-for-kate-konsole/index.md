---
title: "KDE Gear 25.12 with improved Wayland window activation for Kate & Konsole"
date: 2025-12-13T17:30:00+02:00
draft: false
categories: [kde]
tags: [kde]
url: /posts/kde-gear-25.12-with-improved-for-wayland-window-activation-for-kate-konsole/
author: "Christoph Cullmann"
---

[KDE Gear 25.12](https://kde.org/announcements/gear/25.12.0/) got just released.

This includes my fixes (or workarounds) for Konsole & Kate window activation on Wayland.

If you now start Kate or Konsole inside Konsole, the new processes will properly activate their windows to come on top of Konsole.

This works both for just starting new instances and for re-using already running ones.

For more details, see [my older post](/posts/improving-wayland-window-activation-for-kate-konsole/) about the implementation.

At the moment that only works for Konsole & Kate.

If that works nicely for our users, perhaps somebody will come up with a more generic way for that or we can move that workaround to some lower level of the stack.

:) For me that is already a nice Christmas present, I disliked that this was broken for years :)

Btw., thanks again for the amazing [end of the year fundraiser results](https://kde.org/fundraisers/yearend2025/)! €280k and counting :)
