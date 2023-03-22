---
title: "Odilia Version 0.1.0 Released"
authors: ["tait"]
draft: false
date: 2023-03-21T22:30:18-06:00
tags:
  - release
  - odilia
---

After many months---just over a year of hard work, we are proud to announce the initial, beta release of Odilia:
a new, fast, lightweight, screenreader for Linux.
Thanks to all the others who have been instrumental in making Odilia possible:

* @albertotirla (BGTLover)
* @mcb2003 (Fake VIP)
* @luukvanderduim (Luuk Van Der Duim)
* @samtay (Sam Tay)
* Federico Mena and Emmanuel Bassi at GNOME for answering my questions.
* @lparcq (Laurent Pelecq) on Gitlab for the creation of a speech library.

Don't get us wrong, this is still in its initial stages,
and there are a lot of features to implement before we can get to an official, 1.0 release.
However, there is enough functionality to use it, and we want to get it out into the hands of other developers and testers to make this even better for the beta 2 release (0.2), which we're aiming to complete by the end of this year (December 2023).

Please help us make this better so that we can create the next generation of accessible software for open systems.

Here is a quick list of what Odilia is capable of as of today:

* Reading web pages
* Reading GTK and QT applications.
  * GTK4 is not supported yet.
* Configurable voices/rate via `speechd.conf`.
* Generic input system.
  * This means that keybindings can currently be implemented by third-party tools, although Odilia will ship with a defualt way to use keydings soon.

Here is a small list of things which Odilia does not yet currently do, which we are slating for the 1.0 release:

* Support for GTK4 applications
* Key bindings
* MathML support
* Change settings from within Odilia
* Addon support

We encourage those curious about new tech to [download Odilia](/doc/user/installation/) and give it a fair shake.
We're looking forward to making this better with you all!

---Tait Hoyem
