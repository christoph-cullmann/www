---
title: "KTextEditor/Kate Bugs - Scratch Your Own Itch"
date: 2019-05-26T14:25:00+02:00
draft: false
categories: [kde, kate, development]
tags: [kde, kate]
url: /posts/ktexteditor-kate-bugs-scratch-your-own-itch/
---

Two days ago I mentioned [here](/posts/ktexteditor-kate-bugs-help-appreciated/) that the bug report count of KTextEditor and Kate has risen to some not that manageable amount.

For developers that report a bugs or wish, the best way to really get it solved is to scratch your own itch and provide some patch.

I know this is not feasible for all bug reporters, as not all are developers nor will even the developers all have either time nor perhaps the right skill set to tackle the issue on their own.

But if you have the time and you are at least a bit familiar with C++/Qt, you should give it a try.

We can help you to get your patch done, that is much easier for e.g. myself than to motivate me to work on a bug or wish that doesn't concern my normal workflow or lie within my skill set.

For example we have a lot of issues with left-to-right text rendering or related to languages that use complex Unicode surrogates.
Given I have zero knowledge of any language using this my motivation to dig into these issues is small (and I will more likely break more things than fix them).

The same holds for issues in our Vi mode.
I don't use this mode myself nor do I really know how Vi commands shall behave in real life.
Therefore any fix or enhancement there is beyond me.

A good example for such a "Scratch Your Own Itch" approach is [bug 407910](https://bugs.kde.org/show_bug.cgi?id=407910).

It is a small request, to have some action/shortcut to reset the font size to the default one.
We have since years some zoom in/out actions/shortcuts but nothing to go back to the configured one.

I rarely use the zoom stuff, perhaps once in a month, if I want to show something to a colleague on my screen or projector and it is really not readable with my normal font size.
Therefore my motivation to invest any work into yet an other action I will not use regularly is small.

But, in this case, the reporter had the time to invest a bit work into this.

He provided a patch via our [KDE Phabricator - D21412](https://phabricator.kde.org/D21412).

We needed some iterations to get the patch into a usable shape in the bug report and in Phabricator, but thanks to the persistence of the reporter, it got now [pushed](https://cgit.kde.org/ktexteditor.git/commit/?id=968af10fd4b64cccf6a858f105ac6cfad9fce78e) to our repository.

If nobody would have stepped up to provide at least some initial patch for this, such a request for sure would have rotted again in our bug database.

This is not the first time such a nice thing happened, this is just a recent example how such things can work out.

Therefore, if you report something and are capable of given it a try on your own, please do so!

Perhaps even some of the existing [bugs](https://bugs.kde.org/buglist.cgi?bug_severity=critical&bug_severity=grave&bug_severity=major&bug_severity=crash&bug_severity=normal&bug_severity=minor&bug_status=UNCONFIRMED&bug_status=CONFIRMED&bug_status=ASSIGNED&bug_status=REOPENED&columnlist=bug_severity%2Cpriority%2Cassigned_to%2Cbug_status%2Cresolution%2Ccomponent%2Cshort_desc%2Cchangeddate%2Cop_sys%2Crep_platform%2Creporter&known_name=Kate%2FKWrite%20Bugs&list_id=1625288&product=frameworks-ktexteditor&product=kate&query_based_on=Kate%2FKWrite%20Bugs&query_format=advanced) or [wishes](https://bugs.kde.org/buglist.cgi?bug_severity=wishlist&bug_status=UNCONFIRMED&bug_status=CONFIRMED&bug_status=ASSIGNED&bug_status=REOPENED&columnlist=product%2Ccomponent%2Cassigned_to%2Cbug_status%2Cresolution%2Cshort_desc%2Cchangeddate%2Creporter%2Creporter_realname&known_name=Kate%2FKWrite%20Wishs&list_id=1625290&product=frameworks-ktexteditor&product=kate&query_based_on=Kate%2FKWrite%20Wishs&query_format=advanced) are stuff you want to take care of yourself because they concern you!

I think not a lot motivates your more to do something than an issue you have with a tool for your workflow.
At least for me that was the reason to at all start the development of Kate (I missed a MDI variant of KWrite) and join the work on stuff like KTextEditor.
