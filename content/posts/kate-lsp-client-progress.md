---
title: "Kate LSP Client Progress"
date: 2019-05-12T23:54:00+02:00
draft: false
categories: [kde, kate, development]
tags: [kde, kate]
---

The [Kate lsp branch](https://cgit.kde.org/kate.git/log/?h=lsp) contains now the infrastructure as used by Qt Creator.
In addition, [clangd](https://clang.llvm.org/extra/clangd/) is now somehow started in a working state for the first project opened inside Kate.

For example, if you use the CMake Kate project generator and you compile Kate from the "lsp" branch, clangd should pick up the compile_commands.json for a CMake generated Kate project.

;=) Unfortunately not much more than starting and informing clangd about the open workspaces (for the first opened project) works ATM.

If you press ALT-1 over some identifier, you will get some debug output on the console about found links, like below:

{{< highlight bash >}}
qtc.languageclient.parse:   content:  "{\"id\":\"{812e04c6-2bca-42e3-a632-d616fdc2f7d4}\",\"jsonrpc\":\"2.0\",\"result\":[{\"range\":{\"end\":{\"character\":20,\"line\":67},\"start\":{\"character\":6,\"line\":67}},\"uri\":\"file:///local/cullmann/kde/src/kate/kate/katemainwindow.h\"}]}"
{{< / highlight >}}

The current ALT-1 handling is a big hack, as then one just adds the current document and triggers the GotoDefinitionRequest.
A proper implementation tracks the opened/closed documented of the editor.

But at least in principle Kate is now able to start some language server processes and talk a bit with them, all thanks to the nice code borrowed from Qt Creator.

:=) As my spare time is limited, any help in bringing the branch up-to-speed is highly welcome, just drop us a mail to [kwrite-devel@kde.org](mailto:kwrite-devel@kde.org) or mail me in private ([cullmann@kde.org](mailto:cullmann@kde.org)).
A working LSP integration will help to make Kate more attractive for programmers of many languages.
