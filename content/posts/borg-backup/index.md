---
title: "BorgBackup"
date: 2021-08-28T21:00:00+03:00
draft: false
categories: [backup]
tags: [backup]
url: /posts/borg-backup/
author: "Christoph Cullmann"
resources:
  - name: "featured-image-preview"
    src: "images/borg-backup-logo.png"
---

Backup is always something you under-appreciate until you need it.
Therefore, since I lost a lot of my mails due to non-existing backups in the past, I tried to keep proper backups around the last decade.
At least this allowed me to keep all my Kate related development mails intact since 2001 or so, not that bad ;=)

## My old way of doing backups: rsync & duplicity

So far, I did my backup on my Unix machines by using [rsync](https://rsync.samba.org/) to a second host and [duplicity](http://duplicity.nongnu.org/) to archive stuff on my old Synology NAS.

### Plain rsync?

Naturally, the rsync method (if you don't do snapshots/...) is just a 1:1 mirror.
If you do by accident delete stuff and don't notice it, you just will wipe it on the next sync, too, if you don't do some dry-run first to inspect.

But so far, in the normal case, the rsync copy was always what I used to get my data back after I did really break my system.

It's the fastest way to migrate from one operating system to another for me, too, without any fear that you might wipe your data disk.
It helped my nicely on me journey between different Linux distributions to FreeBSD.

### Duplicity?

I started to use duplicity after I did introduce disk encryption at home for all machines years ago.

Given my old NAS has no such concept, duplicity with client side encryption did seem to nicely solve that hole in my data security concept.

Naturally, duplicity allows the normal full/incremental/... backup scheme, that will let you retrieve even older stuff if you by accident deleted stuff locally.

But I never was completely happy with duplicity.
Combined with my old slow NAS, the backup process was always a very slow thing and the progress indication actually never worked properly for me.
I had just for hours some unknown estimated time and no real feedback.
Given I normally don't let my workstation just run the whole day, that was not that satisfying.

On the other side, so far, restoring did work, which is a good thing ;=)
And, like most good open source projects, it works properly on different platforms.
I could easily continue to use the same backup destination after switching from Manjaro to FreeBSD, no problem at all.
duplicity is just nicely installable via pkg there, too!

## The future: BorgBackup?

I investigated a bit more what I could use as duplicity replacement, and ended up giving [BorgBackup](https://www.borgbackup.org/) a try.

<center><a href="https://www.borgbackup.org/" target="_blank"><img width=700 src="/posts/borg-backup/images/borg-backup-logo.png"></a></center>

The [documentation](https://borgbackup.readthedocs.io/en/stable/) is a nice starting point, beside that, you find plenty of useful tutorial online.

On Linux or FreeBSD some usable BorgBackup version is available with the usual package managers.
In my case I am using the version available on FreeBSD 13 via "pkg install py38-borgbackup".

### BorgBackup & Synology

For me, the primary backup target is my old Synology NAS.

Fortunately, you can install BorgBackup on the NAS itself via the package center if you add [SynoCommunity](https://synocommunity.com/#easy-install) as an additional source.
There you will find the "Borg" package in a reasonable fresh version.
No need to fiddle around with the internals of the Synology distribution on your own.

I then activated ssh access & enabled the home directory service to be able to add some authorized_keys & have my backup repository in the home.

### Cloud backup

Given I now start to setup my backup from scratch anyways, I decided to fix a second issue: All my backups are in my flat ;=)

Given either "fire, fire" or "we steal just all stuff, even your crappy NAS", perhaps nobody might really access my data even if stolen, still I could easily loose it all.

As BorgBackup like duplicity works nicely over ssh, no reason not to use it to push all the data encrypted to some random virtual server somewhere.

There are several companies that even promote their BorgBackup compatibility.
But I will not start to promote here cloud/virtual server hosting companies, your search machine will tell you what is available.

### BorgBackup repository initialization

I recommend their [quick start](https://borgbackup.readthedocs.io/en/stable/quickstart.html) documentation for the initial setup.

For me, it was e.g. for the NAS (see the --remote-path to let it find the borg binary on the Synology):

{{< highlight bash >}}
borg init --remote-path /usr/local/bin/borg \
    --encryption=repokey thecooluser@nas-name-here:borg
{{< / highlight >}}

and for the cloud server:

{{< highlight bash >}}
borg init --encryption=repokey \
    thecooluser@server-name-here:borg
{{< / highlight >}}

That command will query some passphrase, use a good one, that is the sole protection of your data.
And keep it somewhere you have it, even in the "fire, fire" case ;=)

### BorgBackup usage

After you did initialize the repositories like above, you will have on your NAS and/or server some borg directory in the home of the matching user.

You can create a new backup archive of e.g. your home (excluding the .cache directory you might not want) via:

{{< highlight bash >}}
borg create --compression zstd --progress --stats \
    -e "/home/your-user/.cache" \
    "thecooluser@server-name-here:borg::name-of-backup-archive" \
    "/home/your-user"
{{< / highlight >}}

On the NAS you will need an additional "--remote-path /usr/local/bin/borg" like for the init command.

### Does this work?

So far it seems so, but time must tell.
As with any backup solution, I will need to test restore again and again and must see how the incremental backups work in practice over time.
At least the initial full backup seems to work more fluent than I was used with duplicity.

Naturally, BorgBackup [had already bugs in the past](https://borgbackup.readthedocs.io/en/stable/changes.html#) and for sure still has some.
The [cryptography isn't perfect either](https://borgbackup.readthedocs.io/en/stable/internals.html), on the other side, I want to protect my personal data against the normal thief, not some government agency.

### Shall I use that?

If this post did spark your interest to try this, please do your own research if it really fits your bill.
In any case, I still have a plain rsync copy around on a second machine, just in case it doesn't work like expected.
Not that I again loose a decade of flame war mails .-)
