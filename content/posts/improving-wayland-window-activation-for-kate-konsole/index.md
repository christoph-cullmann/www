---
title: "Improving Wayland Window Activation for Kate & Konsole"
date: 2025-08-31T21:14:00+02:00
draft: false
categories: [kde]
tags: [kde]
url: /posts/improving-wayland-window-activation-for-kate-konsole/
author: "Christoph Cullmann"
---

## Window Activation, what's that?

In short: for some actions you want to activate your application window.
How to do that differs from platform to platform.

Some weeks ago there was a post by Kai about [window activation on Wayland](https://blog.broulik.de/2025/08/on-window-activation/).

It explains nicely how the [XDG Activation protocol](https://wayland.app/protocols/xdg-activation-v1) works and how the different parts of the KDE & Qt stack implement it to correctly allow to activate the right windows in your KDE Plasma Wayland session.

## What's the issue?

For the most parts this works now flawlessly, but there is some corner case not handled that well at the moment: stuff launched by our terminal emulator Konsole.

This is no large issue for many users, but I rely in my usual workflow with Kate a lot on just being able to do

```bash
❯ kate mycoolfile.cpp
```
in my Konsole window and if Kate is already running to have the existing window activated.

That worked just fine on X11, but on Wayland the safeguards to avoid misuse of window activation stopped that.
There I just get some flashing of the Kate icon in the task switcher.

After some years of ignoring that issues myself and hoping a solution would just materialize, I now gave that some try to fix it myself.

## The hack (solution)

In the most cases it is easy to get the application that launches stuff to export a new *XDG_ACTIVATION_TOKEN* environment variable for the new process and all stuff just works.

Unfortunately that is not that easy for a terminal emulator.

Naturally Konsole could create and export one before starting the shell, but that is an one-time use token.
In the best case the first launched Kate or other application could use it once.

The current solution is to allow applications to query a *XDG_ACTIVATION_TOKEN* via DBus from Konsole, if they can prove they got started inside the shell session by passing a *KONSOLE_DBUS_ACTIVATION_COOKIE* that got exported by Konsole to the shell.

This leads to the following client code in Kate/KWrite and Konsole itself.

```cpp
    // on wayland: init token if we are launched by Konsole and have none
    if (KWindowSystem::isPlatformWayland()
        && qEnvironmentVariable("XDG_ACTIVATION_TOKEN").isEmpty()
        && QDBusConnection::sessionBus().interface()) {
        // can we ask Konsole for a token?
        const auto konsoleService = qEnvironmentVariable("KONSOLE_DBUS_SERVICE");
        const auto konsoleSession = qEnvironmentVariable("KONSOLE_DBUS_SESSION");
        const auto konsoleActivationCookie
            = qEnvironmentVariable("KONSOLE_DBUS_ACTIVATION_COOKIE");
        if (!konsoleService.isEmpty() && !konsoleSession.isEmpty()
            && !konsoleActivationCookie.isEmpty()) {
            // we ask the current shell session
            QDBusMessage m =
                QDBusMessage::createMethodCall(konsoleService,
                    konsoleSession,
                    QStringLiteral("org.kde.konsole.Session"),
                    QStringLiteral("activationToken"));

            // use the cookie from the environment
            m.setArguments({konsoleActivationCookie});

            // get the token, if possible and export it to environment for later use
            const auto tokenAnswer = QDBusConnection::sessionBus().call(m);
            if (tokenAnswer.type() == QDBusMessage::ReplyMessage
                && !tokenAnswer.arguments().isEmpty()) {
                const auto token = tokenAnswer.arguments().first().toString();
                if (!token.isEmpty()) {
                    qputenv("XDG_ACTIVATION_TOKEN", token.toUtf8());
                }
            }
        }
    }
```

The *KONSOLE_DBUS_SERVICE* and *KONSOLE_DBUS_SESSION* environment variables did already exist before, the only new one is the *secret* *KONSOLE_DBUS_ACTIVATION_COOKIE* that is filled by Konsole with some random string per shell session.

The *org.kde.konsole.Session* has now a new *activationToken* method to retrieve a token.
That method will only work if the right cookie is passed and if Konsole itself is the current active window (else it will not be able to request a token internally).

As it easily visible alone from the naming, that is some Konsole only interface and one needs own code in applications that want to make use of it.

Therefore this is more of a hack than a proper solution.

If it inspires others to come up with something generic, that would be awesome!

I will happily help to implement that in Kate and Co., but until that happens, at least my workflow is back working in my [Wayland session](/posts/plasma-kate-wayland-2025/).

## Feedback

You can provide feedback on the matching [Lemmy](https://lemmy.kde.social/post/4473601) and [Reddit](https://www.reddit.com/r/kde/comments/1n53df3/improving_wayland_window_activation_for_kate/) posts.
