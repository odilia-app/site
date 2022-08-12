---
title: "Design"
linkTitle: "Design Overview"
date: 2022-07-24T13:53:51+01:00
lastmod: 2022-08-12T15:29:37+01:00
draft: true
aliases:
  - /design
weight: -110
---

## Components

Screen readers are complex applications that need to interact with many different systems and technologies, and Odilia
is no different. For this reason, the project is split into several crates:

### [Odilia][repo] -- The main application

[repo]: <https://github.com/odilia-app/odilia>

This is the toplevel binary crate, which glues all the smaller crates together. It also handles logging and other
application-wide tasks.

### [atspi][atspi-crate] -- Accessibility Interface

[atspi-crate]: <https://github.com/odilia-app/odilia/tree/main/atspi>

This crate communicates with the [Assistive Technology Service Provider Interface][at-spi], which allows Odilia to
access and present the content in applications and the desktop environment.

[at-spi]: <https://www.freedesktop.org/wiki/Accessibility/AT-SPI>

### [odilia-common][odilia-common] -- Common Algorithms, Data Types and Structures

[odilia-common]: <https://github.com/odilia-app/odilia/tree/main/common>

These are miscellaneous pieces of code shared by other Odilia crates. Among them are the code necessary to parse and
work with keybindings, types used in structural navigation, and types used to read configuration files.

### [odilia-input][odilia-input] -- Input Methods and Events

[odilia-input]: <https://github.com/odilia-app/odilia/tree/main/input>

This crate is responsible for handling input events from devices such as keyboards, mice, and touch screens. It can
swallow input events or pass them onto the application.

### [odilia-tts][odilia-tts] -- Text to Speech

[odilia-tts]: <https://github.com/odilia-app/odilia/tree/main/tts>

This handles talking to [speech-dispatcher][speechd] for text to speech synthesis, as well as formatting messages to be
spoken.

[speechd]: <https://freebsoft.org/speechd>
## Dependencies and Technologies

### [Tokio][tokio] -- Asynchronous Runtime

[tokio]: <https://tokio.rs>

On Unix-like operating systems, IPC is usually handled using [Unix
domain][uds] [sockets][sockets] (UDS). These sockets act very similar to
networking sockets: they're an asynchronous method of communication, where data
could arrive at any time.

[sockets]: <https://manpages.ubuntu.com/manpages/kinetic/en/man7/socket.7.html>
[uds]: <https://manpages.ubuntu.com/manpages/kinetic/en/man7/unix.7.html>

For this reason, we've chosen an asynchronous architecture, which can react to
events as they arrive, and can parallelise the sending and receiving of data
through cooperative multitasking.

Odilia uses the [Tokio runtime][tokio] to achieve this. A good knowledge of Tokio is one of the fundamental building
blocks to understanding, and contributing to, the Odilia codebase, so go take a look at the [Tokio
documentation][tokio-docs].

[tokio-docs]: <https://docs.rs/tokio>

Tokio integrates with Rust's built-in async / await syntax and [Futures][futures], so if you're unfamiliar with them,
the [Rust Async Book][rust-async-book] is a good place to start.

[futures]: <https://doc.rust-lang.org/stable/std/future/index.html>
[rust-async-book]: <https://rust-lang.github.io/async-book/>

### [DBus][dbus] -- Inter-Process Communication

[dbus]: <https://www.freedesktop.org/wiki/Software/dbus/>

Accessibility naturally requires inter-process communication (IPC), so that
assistive technologies like Odilia can get information from, and send events
to, the applications they're presenting to the user. On the Linux desktop, this is handled by [DBus][dbus].

We use the [zbus crate][zbus] ([book][zbus-book]) to talk over DBus. It is asynchronous by default, and integrates well with the [Tokio async runtime](#tokiotokio----asynchronous-runtime).

[zbus]: <https://crates.io/crates/zbus>
[zbus-book]: <https://dbus.pages.freedesktop.org/zbus/1.0/>

Most of the [atspi crate](#atspiatspi-crate----accessibility-interface) was generated using [zbus_xmlgen][zbus_xmlgen]
from the [at-spi DBus interface XML definitions][at-spi-xml]. Note, however, that zbus_xmlgen is, at present, meant to be
run once, and the generated bindings are to be manually tweaked and kept up to date, in order to keep them idiomatic.

[zbus_xmlgen]: <https://crates.io/crates/zbus_xmlgen>
[at-spi-xml]: <https://gitlab.gnome.org/GNOME/at-spi2-core/-/tree/main/xml>
