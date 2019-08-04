---
title: "Kate & C++ Developer Survey"
date: 2019-06-10T22:45:00+02:00
draft: false
categories: [kde, kate, development]
tags: [kde, kate]
url: /posts/kate-cpp-developer-survey/
author: "Christoph Cullmann"
---

While browsing the [ISO C++ homepage](https://isocpp.org) I stumbled over the [results PDF](https://isocpp.org/files/papers/CppDevSurvey-2019-04-summary.pdf) of the [Second Annual C++ Foundation Developer Survey “Lite”](https://isocpp.org/blog/2019/05/results-summary-2019-global-developer-survey-lite).

I was astonished that Kate made it into the "Which development environments (IDEs) or editors do you use for C++ development?" results.

;=) Seems not only I use it as my normal editor for working on C++ code.

And heads up, KDevelop is there, too!

This is actually the second survey, I missed to notice the first one last year.
The [results PDF](https://isocpp.org/files/papers/CppDevSurvey-2018-02-summary.pdf) from [last year](https://isocpp.org/blog/2018/03/results-summary-cpp-foundation-developer-survey-lite-2018-02) shows Kate did show up already there.

We shouldn't be that proud of only having less than three percent usage, but still, we are there at all.
I hope we can rise here a bit in the future.

At least we work on supporting modern C++ standards in the highlighting, e.g. see the recent C++20 improvements ([Phabricator](https://phabricator.kde.org/D21585) + [Commit](https://cgit.kde.org/syntax-highlighting.git/commit/?id=9ba02971123d255c10fca97223538c439e252e3d)). Thanks to Jonathan Poelen for the patch!

[Language Server Protocol (LSP)](/posts/kate-lsp-client-progress/) would help, too, but my initial work is far from usable, help appreciated.
Beside a hacked "goto definition" nothing works at the moment (and it is hardcoded to just start clangd, no other LSP server).
