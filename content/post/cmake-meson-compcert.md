---
title: "CMake & Meson & CompCert"
date: 2020-06-07T16:13:00+02:00
draft: false
categories: [c, development]
tags: [c]
url: /posts/cmake-meson-compcert/
author: "Christoph Cullmann"
---

I tried to compile the [Picolibc](https://github.com/keith-packard/picolibc) that uses the [Meson build system](https://mesonbuild.com/) with [CompCert](http://compcert.inria.fr/).

The CompCert install I tried uses the GNU/GCC toolchain for preprocessing and linking.
That makes the compiler relatively compatible to a GCC, beside that not all command line options are supported.

I was used to [CMake](https://www.cmake.org) projects and there it is normally enough to just set CC=ccomp and you are ready and set (at least if you use the GNU/GCC toolchain).
As long as you don't use special flags in your project, that will just work.

The Picolibc was the first Meson based project I encountered.

There setting CC to ccomp just leads to

{{< highlight bash >}}
 meson.build:1:0: ERROR: Unknown compiler(s): [['ccomp']]
{{< / highlight >}}

I did assume that the project won't compile & link without adjustments, as CompCert doesn't support the full range of command line options like GCC as mentioned above nor the full GNU extensions for C.
But that it directly ends at the compiler initialization in the build system itself was astonishing.

I searched a bit in the internet and it seems, if I really want to get this working, I actually need to patch Meson itself :/
(see how to add a new compiler [here](https://github.com/mesonbuild/meson/commit/74602928100394f6129e064f8e0bfe6c9e08c9d2#diff-1eaa302b42bbbba32f1c6d474d08397e)

At least I found no other solution, actually, I found no real solution for the above error message at all and the code looks like you need to manually add compilers anyways.

Given I want to spend work on getting the C library to compile and not fix a build system, it seems easier to go with the [newlib](https://github.com/mirror/newlib-cygwin) that uses the old autotools,
at least for them the compile starts at all with my CC environment variable and you get to places of interest to fix.

This means for my use case, with a non-standard compiler, I can not see how Meson is an improvement over other existing stuff like CMake or even autotools.
But perhaps this area will improve in the future.
