---
title: "Installing Odilia"
linkTitle: "Installation"
date: 2022-07-24T14:03:55+01:00
draft: true
weight: -20
---

[pr]: <https://github.com/odilia-app/odilia>

## Requirements

Odilia should run on any Unix-like platform with the required dependencies supported by [Rust
](https://doc.rust-lang.org/rustc/platform-support.html). Currently, we primarily target Linux, however, we plan to
support other free operating systems such as \*BSD in the future ([patches welcome][pr]).

The following dependencies are required to build and run Odilia:

### Build Dependencies

* [Rust](https://rust-lang.org) <!-- Todo: determine MSRV -->
* Libclang >= 5.0, required by [Rust Bindgen](https://github.com/rust-lang/rust-bindgen)see [this
  page](https://rust-lang.github.io/rust-bindgen/requirements.html)
    * This is required for generating the Rust bindings to libspeech

### Runtime Dependenceis

* [speech-dispatcher](https://freebsoft.org/speechd) >= 0.9 (>= 0.10 recommended) - text to speech daemon
    * Odilia uses the speech-dispatcher client library: libspeech
* [at-spi2-core](https://gitlab.gnome.org/GNOME/at-spi2-core) - accessibility infrestructure
    * Odilia doesn't use libatspi, it interacts with AT-SPI over DBus directly
    * At-spi required a DBus daemon

## Packages

### Arch

Install the [odilia](https://aur.archlinux.org/packages/odilia) <sup>AUR</sup> package. This will download and build
Odilia from source. Binary packages are planned, but currently unavailable.

## Pre-built Binaries

You can download pre-built Odilia binaries from [our releases page](https://github.com/odilia-app/odilia/releases).

## Building from Source

```sh
# Clone the git repository:
git clone https://github.com/odilia-app/odilia
# Build the project:
cargo build --release
# Optionally, install Odilia:
cargo install --path .
```
