---
title: "Kate LSP Status - July 22"
date: 2019-07-22T22:43:00+02:00
draft: false
categories: [kde, kate, development]
tags: [kde, kate]
url: /posts/kate-lsp-status-july-22/
author: "Christoph Cullmann"
---

After my series of LSP client posts, I got the question: What does this actually do? And why should I like this or help with it?

For the basic question: What the heck is the [Language Server Protocol (LSP)](https://microsoft.github.io/language-server-protocol/overview), I think my [first post](/posts/kate-language-server-protocol-client/) can help. Or, for more details, just head over to the [official what/why/... page](https://langserver.org/).

But easier than to describe why it is nice, I can just show the stuff in action.
Below is a video that shows the features that at the moment work with our master branch.
It is shown using the build directory of Kate itself.

To get a usable build directory, I build my stuff locally with [kdesrc-build](https://kdesrc-build.kde.org/), the only extra config I have in the global section of my **.kdesrc-buildrc** is:

> cmake-options -DCMAKE_BUILD_TYPE=RelWithDebInfo -G "Kate - Unix Makefiles" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

This will auto generate the needed **.kateproject** files for the Kate project plugin and the **compile_commands.json** for **clangd** (the LSP server for C/C++ the plugin uses).

If you manually build your stuff with **cmake**, you can just add the

> -G "Kate - Unix Makefiles" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

parts to your **cmake** call. If you use **ninja** and not **make**, just use

> -G "Kate - Ninja" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

Then, let's see what you can do, once you are in a prepared build directory and have a **master** version of **Kate** in your **PATH**.

<center><a href="https://youtu.be/w0grp9npnNA" target="_blank"><img width=500 src="images/kate-lsp-video.jpg"></a></center>

I hope the quality is acceptable, that is my first try in a long time to do some screen-cast ;)

As you can see, this is already in an usable state at least for C/C++ in combination with **clangd**.

For details how to build Kate master with it's plugins, please take a look at [this guide](https://kate-editor.org/build-it/).

If you want to start to hack on the plugin, you find it in the kate.git, [addons/lspclient](https://cgit.kde.org/kate.git/tree/addons/lspclient).

Feel welcome to show up on [kwrite-devel@kde.org](mailto:kwrite-devel@kde.org) and help out!
All development discussions regarding this plugin happen there.

If you are already familiar with Phabricator, post some patch directly at [KDE's Phabricator instance](https://phabricator.kde.org/differential/).
