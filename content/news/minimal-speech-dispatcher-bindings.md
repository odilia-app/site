---
title: "Minimal speech-dispatcher Bindings Created"
date: 2022-01-06T23:23:20Z
draft: false
---


As of afew days ago, a [minimal binding to speech-dispatcher][spd-rs] (the TTS system for Linux) was created, which
wraps the C functions provided by [Nolan's `speech-dispatcher-sys` crate][spd-sys] in a safe Rust API.
<!--more-->
That means the
speech component of Yggdrasil can now be implemented after the at-spi components are completed, as well as in other Rust
projects that need Linux only TTS, or want more control than the [tts crate][tts-rs] gives them.

These bindings are far from complete, but do provide the essential functionality, such as speaking text, characters and
keys, and getting and setting voice parameters such as rate, pitch, and volume.

In our view, that can't mean anything else but one step closer to the first Yggdrasil prototype!

[spd-rs]: https://github.com/yggdrasil-sr/tts_subsystem
[spd-sys]: https://github.com/ndarilek/speech-dispatcher-sys
    [tts-rs]: https://github.com/ndarilek/tts-rs
