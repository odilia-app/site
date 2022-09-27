---
title: "Installing Odilia"
linkTitle: "Installation"
date: 2022-07-24T14:03:55+01:00
draft: false
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
* [evdev](https://manpages.ubuntu.com/manpages/jammy/man4/evdev.4.html) - input subsystem

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

## Running


To run Odilia, your user account must have access to evdev devices. Evdev is
normally a privileged interface, since any application that can access it could
use it for malicious purposes, for example, creating a keylogger. For this
reason, to run Odilia, you must give yourself access to evdev. This can be done
by running the [setup-permissions.sh shell script][permissions-script] included
with Odilia. The script adds some udev rules, then creates an odilia group. Any
users added to this group and the `input` group will be able to run Odilia.

[permissions-script]: <https://github.com/odilia-app/odilia/blob/main/setup-permissions.sh>

Once you have the correct permissions, you can start Odilia by running the
`odilia` binary.
