---
title: "Removing Files from Git History"
date: 2019-04-15T20:00:00+02:00
draft: false
categories: [git, development]
tags: [git]
---

Today I did run again into an old problem:
You need to archive a lot small and large files inside a single Git repository and you have no support for [Git LFS](https://git-lfs.github.com/) available.
You did this several year and now you ended up in a state where cloning and working with the repository is unbearable slow.

What now? Last time I did run into that, I archived the overfull repository to some "rest in peace" space and used `git filter-branch` to filter out no longer needed and too large objects from a repository copy that then will replace the old one for daily use.

There are a lot of guides available how to use `git filter-branch` for that.
All variants I ever used were complex to do and did take very long.
Especially if you need several tries to get a sane set of stuff you want to remove to gain enough space savings.

This time, I searched once more and stumbled on the [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/).
And yes, it does what it promises on the web site and it seems to be trusted enough to be advertised by e.g. [GitHub](https://help.github.com/en/articles/removing-sensitive-data-from-a-repository), too.

Just following the steps described on their [landing page](https://rtyley.github.io/bfg-repo-cleaner/) allows to shrink your stuff nicely and without a lot of round-trip time.

If you still are just in the "experimenting" phase to see which space decrease one can archive with which file size filter (or which files you want to purge by removing them from master before running the tool), I recommend to swap the step

> git reflog expire --expire=now --all && git gc --prune=now --aggressive

with just

> git reflog expire --expire=now --all && git gc --prune=now

to not wait potential hours for the aggressive GC.
For me that was good enough to get some estimate of the later size for my experiments before I settled to some final settings and did the real run.

**And as always, if you touch your Git history: Do that only if you really need to, keep backups, check carefully that afterwards the repository is in some sensible state (`git fsck --strict` is your friend) and inform all people using that repository that they will need to do a full new clone.**
