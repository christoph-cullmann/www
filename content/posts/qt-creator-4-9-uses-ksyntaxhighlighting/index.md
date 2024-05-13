---
title: "Qt Creator 4.9 uses KSyntaxHighlighting"
date: 2019-04-16T20:45:00+02:00
draft: false
categories: [kde, qt, development]
tags: [kde, qt]
url: /posts/qt-creator-4-9-uses-ksyntaxhighlighting/
author: "Christoph Cullmann"
---

As you can read in the [official Creator 4.9.0 release announcement](https://blog.qt.io/blog/2019/04/15/qt-creator-4-9-0-released/), Qt Creator now uses the [KSyntaxHighlighting Framework](https://api.kde.org/frameworks/syntax-highlighting/html/index.html) for providing the [generic highlighting](https://doc.qt.io/qtcreator/creator-highlighting.html#generic-highlighting).

This is a nice step for the wider adoption of this [MIT](https://opensource.org/licenses/MIT) licensed part of the [KDE Frameworks](https://api.kde.org/frameworks/index.html).

And this is not just an one-way consumption of our work.

The framework got actively patches back that make it more usable for other consumers, too, like [Kate](https://kate-editor.org) ;=)

If you want concrete examples, take a look at:

* D18982: [prevent assertion in regex load](https://phabricator.kde.org/D18982)
* D18996: [Fix building with namespaced Qt](https://phabricator.kde.org/D18996)
* D18997: [Add functions returning all definitions for a mimetype or file name](https://phabricator.kde.org/D18997)
* D19200: [Return sorted definitions for file names and mime types](https://phabricator.kde.org/D19200)
* D19215: [Install DefinitionDownloader header](https://phabricator.kde.org/D19215)

I hope this cooperation will continue in the future.
I thank the people working on Qt Creator that made this integration possible.
I hope the initial effort will pay of with less code for them to maintain on their own and more improvements of the framework for all users.
