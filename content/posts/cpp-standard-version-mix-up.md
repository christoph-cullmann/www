---
title: "C++ Standard Version Mix-up"
date: 2019-12-21T16:09:00+02:00
draft: false
categories: [cpp, development]
tags: [cpp]
url: /posts/cpp-standard-version-mix-up/
author: "Christoph Cullmann"
---

At [work](https://www.absint.com/) we use the LLVM/clang libraries for pre-processing and parsing C/C++ stuff.

During some experimenting with the current master version of these libraries, I stumbled on unexpected crashes inside our unit-tests on Windows.

We work with MSVC 2019 on Windows and all worked fine with LLVM 9.x, but with master, close to all my tests did now segfault in aligned_free.

I first thought that might be some current regression in LLVM master, but after tracing it back to having DenseSet/Map crashing during destruction, this seemed unlikely.

On further investigation, the fault is really hilarious: We compiled the LLVM libraries with the default language standard as set there in the CMake tooling: C++14.

On the other side, we compiled our own tools that use these libraries with C++17.

Some months ago, the implementation of DenseMap got improved to use the [allocate_buffer/deallocate_buffer](https://github.com/llvm/llvm-project/blob/master/llvm/include/llvm/Support/Compiler.h) functions to use (if possible) aligned allocation.

Unfortunately, this means, during the compilation of the library, the checks there ensure it doesn't use these code paths, on the other side, during compilation of our tools, it does, as the allocation functions are fully inline in the header including the feature checks.

For operating systems != Windows, this doesn't hurt that much, as you can use the normal free for stuff allocated with the aligned variants (and vice versa).

Unfortunately (or fortunately, to detect this screw-up), this doesn't hold for the MSVC run-time on Windows.

If one uses a consistent C++ standard version for the compilation of the whole tool-chain, all is fine.

Therefore, if somebody stumbles on the same kind of crashes, perhaps this blog post can avoid some longer bug hunting.

A usual crash backtrace of such an error would look like:

{{< highlight c >}}
0x00000000778ca12f - RtlFreeHeap
0x000007fef90ba8b0 - free_base
0x000007fef910ffe2 - aligned_free
0x0000000140113fa7 - llvm::TypeFinder::~TypeFinder
{{< / highlight >}}
