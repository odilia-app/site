---
title: "Design"
linkTitle: "Design Overview"
date: 2022-07-24T13:53:51+01:00
draft: true
aliases:
  - /design
---

## Inter-Process Communication - DBus

Accessibility naturally requires inter-process communication (IPC), so that
assistive technologies like Odilia can get information from, and send events
to, the applications they're presenting to the user. On the Linux desktop, this is handled by [DBus][dbus].

[dbus]: <https://www.freedesktop.org/wiki/Software/dbus/>

We use the [zbus crate][zbus] ([book][zbus-book]) to talk over DBus. It is asynchronous by default, and integrates well with the [Tokio async runtime](#asynchronous-runtime---tokio).

[zbus]: <https://crates.io/crates/zbus>
[zbus-book]: <https://dbus.pages.freedesktop.org/zbus/1.0/>

## Asynchronous Runtime - Tokio

On Unix-like operating systems, IPC is usually handled using [Unix
domain][uds] [sockets][sockets] (UDS). These sockets act very similar to
networking sockets: they're an asynchronous method of communication, where data
could arrive at any time.

[sockets]: <https://manpages.ubuntu.com/manpages/kinetic/en/man7/socket.7.html>
[uds]: <https://manpages.ubuntu.com/manpages/kinetic/en/man7/unix.7.html>

For this reason, we've chosen an asynchronous architecture, which can react to
events as they arrive, and can parallelise the sending and receiving of data
through cooperative multitasking.

Odilia uses the [Tokio runtime](https://tokio.rs) to achieve this. A good
knowledge of Tokio is one of the fundamental building blocks to understanding,
and contributing to, the Odilia codebase, so go take a look at the [Tokio documentation](https://docs.rs/tokio).
