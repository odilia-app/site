---
title: "The First Prototype Has been Released!"
authors: ["bgt-lover"]
date: 2021-10-26T22:45:41Z
draft: false
tags:
  - release
  - prototype
---

We know it has been a long time, however we are delighted to inform you that the first Odilia prototype is up on GitHub,
with a very early alpha stage build for anyone curious enough to try it out.  

If you want to try it out, the link is here:

<https://github.com/yggdrasil-sr/yggdrasil-prototype/releases/>

the screen reader can't do much at the moment, however this is what it can do so far

* like any normal screen reader, it can read most components exposed by the Linux accessibility interface, such as
  buttons, checkboxes, radio buttons, etc.  An exception to this is the WebView control and interacting with text boxes,
  though the latter might be implemented around the end of the week, if everything goes well.

* some web elements can be navigated through and interacted with, for example links, buttons, checkboxes, forms, etc,
  even though text inside the webview and quick navigation doesn't work yet. As we all know, this is the first release
  of an alpha quality software, so feel free to report bugs by opening issues against the repository. However, here are
  some known issues that we will attempt to fix in the next couple releases, so no need to report those

* sometimes, the name or text of a control might not be announced, the speech saying something like ":button", mark the
  punctuation.  This is most likely caused by at-spi sending events to Odilia before the controls actually finished
  loading, so the control names and other attributes might not be filled in by the time Odilia gets the event, though
  they aren't null since the data exists somewhere, just didn't exist then.

* if a control uses something else than name or text to label itself, for example tooltips, Odilia won't pick those as
  valid ways of labeling, so it will either speak the same as described above, or it could even say unlabeled in some
  cases

* currently, there's no other way to quit the screen reader other than sending it a keyboard interrupt signal, or
  killing the process in another way. This is because the binding generators we work with make stuff more complicated,
  so no keyboard handlers in this release.

* on some machines, it's reported that the screen reader doesn't read window titles when cycling between them with
  alt+tab. Currently, we don't know why this is, but we're investigating still.

The road to here was a very rough one indeed, however we are excited we could bring this to you, as demo quality as this
is. This means much to us, it proves progress is being done, against all odds.  

If you want to see more content from us, consider visiting our website more often, this way you won't lose anything.
Furthermore, you will get information from the source of the project, so you can confirm its authenticity for yourself
