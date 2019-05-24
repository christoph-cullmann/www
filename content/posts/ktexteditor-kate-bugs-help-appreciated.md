---
title: "KTextEditor/Kate Bugs - Help Appreciated"
date: 2019-05-24T16:20:00+02:00
draft: false
categories: [kde, kate, development]
tags: [kde, kate]
---

The bug report count of KTextEditor (implementing the editing part used in Kate/KWrite/KDevelop/Kile/...) and Kate itself reached again
some value over 200.

If you have time and need an itch to scratch, any help to tackle the currently open bugs would be highly appreciated.

The full list can be found with this [bugs.kde.org query](https://bugs.kde.org/buglist.cgi?bug_severity=critical&bug_severity=grave&bug_severity=major&bug_severity=crash&bug_severity=normal&bug_severity=minor&bug_status=UNCONFIRMED&bug_status=CONFIRMED&bug_status=ASSIGNED&bug_status=REOPENED&columnlist=bug_severity%2Cpriority%2Cassigned_to%2Cbug_status%2Cresolution%2Ccomponent%2Cshort_desc%2Cchangeddate%2Cop_sys%2Crep_platform%2Creporter&list_id=1624725&order=bug_id%20DESC&product=frameworks-ktexteditor&product=kate&query_based_on=Kate%2FKWrite%20Bugs&query_format=advanced).

Easy things anybody with a bit time could do would be:

* check if the bug still is there with current master builds, if not, close it it
* check if it is the duplicate of a similar still open bug, if yes, mark it as duplicate

Beside that, patches for any of the existing issues are very welcome.

I think the best guide how to setup some development environment is on our [KDE Community Wiki](https://community.kde.org/Guidelines_and_HOWTOs/Build_from_source).
I myself use a kdesrc-build environment like described there, too.

Patches can be submitted for an review via our [KDE Phabricator](https://phabricator.kde.org/differential/).

If it is just a small change and you don't want to spend time on Phabricator, attaching a git diff versus current master to the bug is ok, too.
Best mark the bug with a **[PATCH]** prefix in the subject.

The team working on the code is small, therefore please be a bit patient if you wait for reactions.
I hope we have improved our reaction time in the last months but we still are lacking in that respect.
