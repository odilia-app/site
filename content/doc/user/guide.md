---
title: "Odilia Users Guide"
date: 2022-07-20T13:27:16+01:00
draft: true
weight: -10
---

Odilia should start speaking immediately when started.
Some key bindings may feel familiar, like `capslock+b` for browse mode and `h` to go to the next heading.

Some things may feel different.
Note that for one thing, Odilia does not change modes automatically for you.
This could be added in the future, but we are starting with a very minimal system to begin with;
we are happy to expand as feature requests arise.

Here is a list of keybindings as of the latest release:

* `capslock + b` -- enable browse mode
  * `shift + i` -- go to previous list item
  * `i` -- go to next list item
  * `shift + l` -- go to previous list
  * `l` -- go to next list
  * `shift + k` -- go to previous link
  * `k` -- go to next link
  * `shift + b` -- go to previous button
  * `b` -- go to next button
  * `shift + h` -- go to previous heading
  * `h` -- go to next heading
* `capslock + f` -- enable focus mode

Suggest a new key binding by opening a new issue on [Github](https://github.com/odilia-app/odilia/issues/).

## What Works

* Basic structural navigation.
* Caret navigation.
* Tab navigation.

## What Doesn't Work

* QT Applications (see list of [popular QT applications](https://wiki.manjaro.org/index.php?title=List_of_Qt_Applications))
* `aria-live` regions on a web-page will not update in real time.
* Terminals -- Odilia will read the entire buffer, not just the new lines.

