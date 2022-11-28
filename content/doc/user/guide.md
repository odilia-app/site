---
title: "Odilia Users Guide"
date: 2022-07-20T13:27:16+01:00
draft: false
weight: -10
---

Odilia should start speaking immediately when started.
Some key bindings may feel familiar, like `capslock+b` for browse mode and `h` to go to the next heading.

Some things may feel different.
Note that for one thing, Odilia does not change modes automatically for you.
This could be added in the future, but we are starting with a very minimal system to begin with;
we are happy to expand as feature requests arise.

Here is a list of keybindings as of the latest release:

* `left` and `right` -- change text granularity to a single character
* `control + left` and `control + right` -- change text granularity to a single word
* `up` and `down` -- change text granularity to a single line
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
  * `shift + g` -- go to previous graphic
  * `g` -- go to next graphic
  * `shift + f` -- go to previous form
  * `f` -- go to next form
  * `shift + t` -- go to previous table
  * `t` -- go to next table
  * `shift + r` -- go to previous radio button
  * `r` -- go to next radio button
  * `shift + x` -- go to previous checkbox
  * `x` -- go to next checkbox
  * `shift + c` -- go to previous radio button
  * `c` -- go to next combo box
  * `shift + s` -- go to previous section
  * `s` -- go to next section
  * `shift + m` -- go to previous math
  * `m` -- go to next math
  * `shift + a` -- go to previous frame
  * `a` -- go to next frame
  * `shift + minus` -- go to previous separator
  * `minus` -- go to next separator
  * `shift + e` -- go to previous entry
  * `e` -- go to next entry
* `capslock + f` -- enable focus mode

Suggest a new key binding by opening a new issue on [Github](https://github.com/odilia-app/odilia/issues/).

## What Works

* Basic structural navigation.
* Caret navigation.
* Tab navigation.

## What Doesn't Work

* `aria-live` regions on a web-page will not update in real time.
* Terminals -- Odilia will read the entire buffer, not just the new lines.

