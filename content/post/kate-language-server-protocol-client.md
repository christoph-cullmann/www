---
title: "Kate Language Server Protocol Client"
date: 2019-04-28T20:36:00+02:00
draft: false
categories: [kde, kate, development]
tags: [kde, kate]
url: /posts/kate-language-server-protocol-client/
---

The [Language Server Protocol (LSP)](https://microsoft.github.io/language-server-protocol/overview) allows the integration of stuff like code completion, jump to definition, symbol search and more into an application without manual re-implementation for each language one wants to support.
LSP doesn't fully allow an integration like [KDevelop](https://www.kdevelop.org) or Qt Creator do with the [libclang](https://clang.llvm.org/docs/Tooling.html) based tooling aimed for C/C++ but on the other side offers the possibility to interface with [plenty of languages](https://langserver.org/#implementations-server) without a large effort on the client side.

If one takes a look at some current [LSP clients list](https://langserver.org/#implementations-client), a lot of editors and IDEs have joined the LSP family in the last years.

In the past I was always scared away to start implementing this in Kate, as no readily available library was around to do the low-level work for the client.
Whereas you get some reference stuff for the JSON based protocol for JavaScript and such, for Qt nothing was around.

Fortunately Qt Creator started to implement an LSP client beginning with [the 4.8 release](https://blog.qt.io/blog/2018/12/06/qt-creator-4-8-0-released/).

Based on this code, I started now to get this into the Kate project plugin.
At the moment not much more has happened then some initial import of the Qt Creator LSP infrastructure code into the [Kate lsp branch](https://cgit.kde.org/kate.git/log/?h=lsp).

If I get this working (help is welcome!), any improvements will be submitted back to the Qt Creator implementation.
If it really starts to work well in Kate, one might think about some better code sharing in the long term.
But before such plans, first at least some basic things must work for some initial language server like [clangd](https://clang.llvm.org/extra/clangd/).
