---
title: "One More Thing - Final Prototype Released"
authors: [thefake-vip]
date: 2022-02-12T11:47:27Z
tags:
  - prototype
  - release
draft: false
---

[repo]: <https://github.com/odilia-app/odilia-prototype>
[release]: <https://github.com/odilia-app/odilia-prototype/releases/tag/v-0.1.0>
[download]: <https://github.com/odilia-app/odilia-prototype/releases/download/v-0.1.0/odilia-release.tar.gz>
[discussions]: <https://github.com/odilia-app/odilia-prototype/discussions>

[libatspi]: <https://gitlab.gnome.org/GNOME/at-spi2-core/-/tree/master/atspi>
[dbus]: <https://www.freedesktop.org/wiki/Software/dbus/>
[dbus-crate]: <https://crates.io/crates/dbus>
[zbus]: <https://crates.io/crates/zbus>
[tokio]: <https://crates.io/crates/tokio>
[rust-2021]: <https://doc.rust-lang.org/edition-guide/rust-2021/index.html>
[evdev]: <https://manpages.ubuntu.com/manpages/jammy/man4/evdev.4.html>
[odilia-input]: <https://github.com/odilia-app/odilia-input>
[odilia-common]: <https://github.com/odilia-app/odilia-common>
[udev]: <https://www.linux.com/news/udev-introduction-device-management-modern-linux-system/>
[permissions-script]: <https://github.com/odilia-app/odilia-prototype/blob/main/setup-permissions.sh>
[log]: <https://crates.io/crates/log>
[env_logger]: <https://crates.io/crates/env_logger>
[env_logger-docs]: <https://docs.rs/env_logger/latest/env_logger/#enabling-logging>

As we [announced recently](../enough-prototypes), we decided that we'd learned enough from [the Odilia prototype][repo]
to actually implement the real thing. The prototype code, while functional, prioritised experimentation over quality,
and thus we'll be throwing almost all of it out completely, but the code is far less important than the experience we
gained from writing it.

As far as I'm concerned, ditching the prototype completely was always part of the plan. From personal experience, large
projects always get rewritten after a while, so I figured it would be better to plan for that, and reap the benefits of
a clean, modular codebase, hopefully free of bad decisions. It does, however, mean we might not have another release out
for a while. So we decided to glue together the latest work in the prototype, get it compiling, and release it, as a
*very early* look at what Odilia could be in the future.

## Changes Since the Last Release

Since [the first prototype](../first-prototype), almost everything has changed:

* We upgraded to [the Rust 2021 edition][rust-2021].
    * All our code will use `edition = "2021"` going forward.
* After analysing our options, we decided to ditch binding [libatspi][libatspi] using GObject Introspection, and instead
  communicate with at-spi directly over [D-Bus][dbus]. In the prototype this has been done with the [dbus
  crate][dbus-crate], but we intend to use [zbus][zbus] going forward.
    * The community around `zbus` seems more active, and its API, workflow, and tight [Tokio][tokio] integration will
      work well for us.
* We introduced [input handling][odilia-input] using the [evdev kernel API][evdev], and used it to allow you to press
  the <kbd>ctrl</kbd> key to pause speech.
    * I plan to explain our rationale behind using evdev, instead of a higher level library like lininput, or for that
      matter at-spi's own input events, in a future post, as it's an interesting topic.
* Using evdev requires specific permissions to be set up via [udev][udev], so we created a [setup-permissions.sh
  script][permissions-script] to do this for you.
* We added support for different modes in the [odilia-common crate][odilia-common], though these were never fully taken
  advantage of.
* We added basic, messy structural navigation.
* We made sure the screen reader can't panic by trying to read non-existant accessibles. Instead, it will only read the
  attributes of the valid ones.. If an invalid accessible is incountered, it will silently be skipped for now.
* We changed all debug messages to use the fantastic [log crate][log], with [env_logger][env_logger] as the log
  implementation.
    * This means you can control Odilia's log output with the `RUST_LOG` environment variable, see [the env_logger
      documentation][env_logger-docs] for examples of what you can set this variable to.

## Using It

If you want to try out this last prototype for yourself, you can download it from the [Github release][release]. Here's
a [direct link to the compiled program and scripts][download].

As I said above, evdev is normally a privileged interface, since any
application that can access it could use it for malicious purposes, for
example, creating a keylogger. For this reason, to run Odilia, you must give
yourself access to evdev. This can be done by running the [setup-permissions.sh
shell script][permissions-script] included with Odilia. The script adds some
udev rules, then creates an odilia group. Any users added to this group and the
`input` group will be able to run Odilia.

Once you've given yourself the correct permissions, you can start Odilia by
running `startup.sh` in the release tar ball. You can stop Odilia by running
`shutdown.sh`.

Since this is the final release, we won't be fixing bugs, but if you have any
feedback, feel free to [leave it on Github][discussions].

Stay tuned, we'll be posting about the new, production-quality Odilia soon.
