---
title: "Odilia Version 0.1.0 Released"
authors: ["tait", "bgt-lover"]
draft: false
date: 2023-03-21T22:30:18-06:00
tags:
  - odilia
  - release
---

After many months, in fact, just over a year of hard work, we are proud to announce the initial, beta release of Odilia: a new, fast, lightweight screenreader for Linux, written in rust for maximum speed and efficiency.

Thanks to all the others who have been instrumental in making Odilia possible:

* @albertotirla (BGTLover)
* @mcb2003 (Fake VIP)
* @luukvanderduim (Luuk Van Der Duim)
* @samtay (Sam Tay)
* Federico Mena and Emmanuel Bassi at GNOME for answering my questions.
* @lparcq (Laurent Pelecq) on Gitlab for the creation of a speech library.

Besides the core contributors to this project, we extend a huge thank you to all the members of our extended community, those nevertheless key people who stood by us and our beliefs against all odds, when hope appeared lost, when the date of this release got further and further away, even when many people already dismissed this project as a failure. Because you stand strong and believe in our vision of a better linux desktop, you help us shape it, therefore you become an integral and indispensible part of it. Congratulations, everyone! this is not only an odilia release, not only made by us. This, hopefully, marks the beginning of a much brighter future for accessibility in the linux desktop, and why not, maybe even accessibility in general. These are the small steps which will make linux more inclusive for everyone, developers and users alike. Keep being awesome, folks! Help us make linux great again!

Don't get us wrong, this is still in its initial stages, there are a lot of features to implement before we can get to an official 1.0 release. However, there is enough functionality for a minimum viable product, which is all that matters for this first non-prototype release. That's why we want to get it out into the hands of other developers and testers alike, in order to make this even better for the beta 2 release (0.2), which we're aiming to complete by the end of this year.

Here is a quick list of what Odilia is capable of as of today:

* Reading web pages
* Reading GTK and QT applications.
  * GTK4 is not supported yet.
* Configurable voices/rate via `speechd.conf`.
* Generic input system.
  * This means that keybindings can currently be implemented by third-party tools by writing to a special odilia socket, although Odilia will ship with a default way to use key bindings soon, hopefully supporting both X11 and Wayland.

Here is a small list of things which Odilia does not yet currently do:

* Support for GTK4 applications
* Key bindings
* reading and reacting with incoming notifications
* MathML support
* Change settings from within Odilia
* table navigation
* object navigation
* reading the window title and announcing what the switcher is focused on when alt+tab and similar shortcuts are pressed
* Addon support

We encourage those curious about new tech to [download Odilia](/doc/user/installation/) and give it a fair shake. Note: currently, we're not providing binary versions of odilia, since producing those is not automatic and the "it works on my machine" simdrome can still happen, plus we don't have access to any other packaging methods besides the archlinux specific AUR. The procedure isn't complicated however, so I think you can install it without issues.

As always, thanks everyone for helping us make a better screenreader for the linux desktop, one step at a time!
