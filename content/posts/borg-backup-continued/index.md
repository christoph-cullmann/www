---
title: "BorgBackup - Continued"
date: 2021-09-10T22:45:00+03:00
draft: false
categories: [backup]
tags: [backup]
url: /posts/borg-backup-continued/
author: "Christoph Cullmann"
resources:
  - name: "featured-image-preview"
    src: "images/borg-backup-logo.png"
---

In my last [BorgBackup post](/posts/borg-backup/) I described my new setup using [BorgBackup](https://www.borgbackup.org/) for the backup of my private data.

After two weeks of use, I have now first experiences on the way the incremental backups perform and some additional information how I apply this to backup a virtual FreeBSD server hosting some of my stuff.

## Incremental Backup Performance ;=)

I must confess, I am positively impressed.

As told before, my [duplicity](http://duplicity.nongnu.org/) setup did have a very bad performance (even just in the locally to my NAS).
Perhaps I did something wrong, on the other side, I followed the default way as described to setup a encrypted backup.

On the other side, the new BorgBackup powered variant performs well locally (with 1 GBit networking) and remotely (with just between 25-50 MBit upload).

Instead of multi-hours to sync, the new variant runs in minutes.

Naturally, for larger increments, the upload is the restricting part here, this means for the remote backup, some minutes upload are added on top.

Let's see what happens if I backup my data again after I bought some music album online and the usual stuff that happens in a day:

<pre>
Time (start): Fri, 2021-09-10 20:38:39
Time (end):   Fri, 2021-09-10 20:39:19
Duration: 40.65 seconds
Number of files: 68984
Utilization of max. archive size: 0%
------------------------------------------------------------------------------
                       Original size      Compressed size    Deduplicated size
This archive:              256.50 GB            249.26 GB            405.36 MB
All archives:                1.82 TB              1.77 TB            240.18 GB

                       Unique chunks         Total chunks
Chunk index:                  148438              1118042
------------------------------------------------------------------------------
</pre>

Just the expected, more or less the size of my new album + a bit more given other minor things in my home did change, like this blog post ;=)

More or less the same happens for my remote increment:

<pre>
Time (start): Fri, 2021-09-10 20:38:32
Time (end):   Fri, 2021-09-10 20:40:52
Duration: 2 minutes 20.11 seconds
Number of files: 68984
Utilization of max. archive size: 0%
------------------------------------------------------------------------------
                       Original size      Compressed size    Deduplicated size
This archive:              256.50 GB            249.26 GB            405.32 MB
All archives:                2.38 TB              2.32 TB            240.41 GB

                       Unique chunks         Total chunks
Chunk index:                  148994              1454388
------------------------------------------------------------------------------
</pre>

The backup time is more or less just the local network backup time + the extra time you need for the poor 25-50 MBit upload speed.

This looks reasonable and allows to run this daily via cron or other means without large impact on my local machine.

I have already a few increments online, e.g. for roughly each second day (the data varies here on the remotes, not all have the exactly same backups).
Still the combined archives size on both remotes is below the actual size of the raw data I backup.

The [Zstandard](https://en.wikipedia.org/wiki/Zstandard) compression I did choose for the backup has a small impact, most of my stuff is already either compressed or likely not that well suites for further compression.
But BorgBackup was able to de-duplicate already in the initial backup a few things that are redundant in my home, like duplicated albums I have by accident in different folders.
Good hints what to cleanup if I need again disk space ;=)

## Full FreeBSD server backup

I own some virtual FreeBSD server to host various things.
I backup that server to a pure backup server without any other services regularly.

Below is the setup to do this via rsync & BorgBackup in some hopefully both secure and usable way.

The below stuff runs as a plain old cronjob without any other fancy stuff around.

### First step: Plain rsync

The basic backup is just a plain rsync of more or less all things.

{{< highlight bash >}}
rsync -alHSvh --no-specials --no-devices \
    --delete --force --stats \
    "root@my-cool-server:/" "/some-where/my-backup"
{{< / highlight >}}

Naturally on the server we pull our backups from, some stuff like databases are dumped to the local disk via cron before this rsync run, to have some consistent data and not relying on good luck that e.g. the database that way on disk during this sync was consistent (that will most likely not be the case).

Using this method, on the actual server, you have no way to get access to the backup server.
The backup server will just pull all stuff via rsync.
Even if somebody breaks into the actual server running my services, getting to the backup server will still be as hard as without any access to the first server.

If you like to copy this, keep in mind: the above rsync call will rsync all mounted file systems.
This is useful for me, as e.g. the FreeBSD machine has ZFS with a bunch of individual mount points (like the standard FreeBSD ZFS setup) and I really just want to have everything.

### Second step: History via BorgBackup

This rsync method is easy and fast, but it provides no history.
As this sync runs nightly, if I ever delete e.g. some mail on my server by accident and not notice that before the nightly deadline => all hope (and the mail) is lost!

A nice solution for this is to use BorgBackup to backup your synced files once more into a local repository.

This might sound a bit strange, why not just use BorgBackup directly, but it has a few benefits:

* The normal BorgBackup way will need access to the backup server from the server you backup => Once you capture the server, you might be able to do evil things on the backup server or at least mess with the backups.
* There are ways to pull via BorgBackup, but they are complicated and still will rely on BorgBackup to have no exploitable holes, I trust rsync more in that regard (but you can still try [the described pull variants](https://borgbackup.readthedocs.io/en/stable/deployment/pull-backup.html) if you are less paranoid).
* You have a plain 1:1 copy always available, in the case BorgBackup really screws up. If you have the space for that one copy, I think that extra safety is nice.

#### Initial preparation of the repository

You need to create once the repository.
I use for that no encryption, I have anyways my not encrypted rsync copy on the same backup machine:

{{< highlight bash >}}
borg init --encryption=authenticated "/some-where/my-backup.borg"
{{< / highlight >}}

The documentation recommends the "authenticated" variant to avoid issues with malicious input data.
Given a bit more hashing won't hurt as I will use compression, too, I just went with that recommendation (without a passphrase).
If you like to skip that, use "none".
But better read [the documentation](https://borgbackup.readthedocs.io/en/stable/usage/init.html) yourself.

#### Create increment after rsync

After each daily rsync, just create a new increment via:

{{< highlight bash >}}
borg create --compression zstd --stats \
    "/some-where/my-backup.borg::{now:%Y-%m-%d}" \
    "/some-where/my-backup"
{{< / highlight >}}

And that's it ;=)

#### Performance

The initial BorgBackup run is slow (single core machine), but the compression actually make at least some visible difference on my server data, not just the de-duplication:

<pre>
Time (start): Fri, 2021-09-10 21:21:35
Time (end):   Fri, 2021-09-10 22:02:00
Duration: 40 minutes 25.12 seconds
Number of files: 259439
Utilization of max. archive size: 0%
------------------------------------------------------------------------------
                       Original size      Compressed size    Deduplicated size
This archive:               56.48 GB             45.17 GB             40.61 GB
All archives:               56.48 GB             45.17 GB             40.61 GB

                       Unique chunks         Total chunks
Chunk index:                  252076               278721
------------------------------------------------------------------------------
</pre>

An increment is a much faster thing, just like for my normal backup:

<pre>
Time (start): Fri, 2021-09-10 22:16:36
Time (end):   Fri, 2021-09-10 22:19:36
Duration: 2 minutes 59.12 seconds
Number of files: 259624
Utilization of max. archive size: 0%
------------------------------------------------------------------------------
                       Original size      Compressed size    Deduplicated size
This archive:               56.51 GB             45.18 GB             46.81 MB
All archives:              112.99 GB             90.35 GB             40.66 GB

                       Unique chunks         Total chunks
Chunk index:                  252551               557639
------------------------------------------------------------------------------
</pre>

Btw., the rsync received size was ~76 MB for the above run, BorgBackup did break this down to just 46 MB for the increment, not that bad.

And just 3 minutes more for the nightly run in addition to the plain rsync, I would say nicely usable even on my single core machine.

## Conclusion

As shown above, I think BorgBackup performs well for my use case.

The increments are reasonable small and fast, seems to be no issue to have daily ones.

Naturally, one will later start to expire older backups, I will need to read up more about this in the future, I just skimmed through that parts of the documentation so far.

At least for my personal data and server backup, this seems to be now a rather nice setup.

I hope this is helpful for others, too, but please always do your own research.
There are plenty of other open-source backup tools out there, perhaps they fit your requirements better.

But at least from my side: thanks to the BorgBackup developers to provide the world with such an useful piece of software!

At least my backup setup got successfully assimilated .P

<center><a href="https://www.borgbackup.org/" target="_blank"><img width=700 src="/posts/borg-backup/images/borg-backup-logo.png"></a></center>
