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

* [Rust](https://rust-lang.org)

### Runtime Dependenceis

* [speech-dispatcher](https://freebsoft.org/speechd) >= 0.9 - text to speech daemon
* [at-spi2-core](https://gitlab.gnome.org/GNOME/at-spi2-core) - accessibility infrastructure
    * Odilia doesn't use libatspi, it interacts with AT-SPI over DBus directly, but the daemon must be running.
* [systemd](https://github.com/systemd/systemd) - auto-launching for an AT-SPI daemon

## Packages

### Arch

Install the [odilia](https://aur.archlinux.org/packages/odilia) <sup>AUR</sup> package. This will download and build
Odilia from source. Binary packages are planned, but currently unavailable.

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

Simply run the `odilia` binary created by the compilation step, or, if installed to a system path, you can simply type `odilia` in a terminal.
