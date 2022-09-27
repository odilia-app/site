---
title: "Useful Links"
date: 2022-08-12T15:07:41+01:00
draft: false
weight: -100
---

## At-spi

* [General overview](https://www.freedesktop.org/wiki/Accessibility/AT-SPI2/), with several links
* [Accessible Document Navigation Using AT-SPI](https://accessibility.linuxfoundation.org/a11yspecs/atspi/adoc/ADOC_ATSPI.html#rendering)
* [API documentation](https://www.manpagez.com/html/libatspi/libatspi-2.10.1/ch01.php)
* [Examples](https://github.com/infapi00/at-spi2-examples), including Javascript, C and Python
* [Examples exclusively using py-atspi2](https://www.freedesktop.org/wiki/Accessibility/PyAtSpi2Example/), the human-generated bindings, not the ones generated via GObject Introspection
* [Odilia's atspi crate](https://github.com/odilia-app/odilia/tree/main/atspi)

## Speech

* [libspeech library documentation](http://htmlpreview.github.io/?https://github.com/brailcom/speechd/blob/master/doc/speech-dispatcher.html)
* [Speech Synthesis Interface Protocol (SSIP) API documentation](http://htmlpreview.github.io/?https://github.com/brailcom/speechd/blob/master/doc/ssip.html)
* [Speech Synthesis Markup Language (SSML) Version 1.1](https://www.w3.org/TR/speech-synthesis/)
* [Raw FFI Rust bindings to libspeech](https://crates.io/crates/speech-dispatcher-sys)
* [Idiomatic Rust bindings to libspeech](https://crates.io/crates/speech-dispatcher), what we're currently using
* [Pure Rust interface to speech-dispatcher](https://crates.io/crates/ssip-client), what we'd like to use
* [Odilia's tts crate](https://github.com/odilia-app/odilia/tree/main/tts)

## Braille

* [Liblouis users and programmers manual](http://liblouis.org/documentation/liblouis.html)
* [Liblouis bindings for rust](https://github.com/whentze/liblouis-rust), for braille tables and multiple braille codes, including those for the majority of languages
* [Libbrlapi reference manual](https://brltty.app/doc/Manual-BrlAPI/English/BrlAPI.html)
