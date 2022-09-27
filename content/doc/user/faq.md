---
title: "FAQ"
date: 2022-07-20T13:31:00+01:00
draft: false
---

## Why doesn't my favourite keybinding work?

Either one of the following two things have happened:

1. We haven't implemented functionality for this keybinding as of yet. (Just ask nicely, and we should be able to)
2. The keybinding is different than what you're used to. This can be tweaked by changing the contents of your `sohkdrc` file.

Please feel free to reach out via [Github issues](https://github.com/odilia-app/odilia/issues/), if you think there is something missing.

## How do I change my speech rate?

Your speech rate must be changed in your speech dispatcher settings.
This is often in a file called `speechd.conf` either in your `$XDG_HOME` directory, or in `/etc/speech-dispatcher/`.
The value you want to change is `DefaultRate`.
It accepts a value between 0 and 100.

## How Can I Help?

As a user, there are two best things you can do:

1. Open new issues when there are features missing or broken [on our Github page](https://github.com/odilia-app/odilia/issues).
2. Donate a small fraction of your monthly budget to helping us move away from our current jobs, to write software for you. We do this because we love accessibility, and we love free software; but, without external support we can only work on this in our free time.
    * Tait Hoyem -- [Librapay](https://liberapay.com/tait/)

