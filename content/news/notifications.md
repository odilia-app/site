---
title: "Going The Way Of the Notification"
date: 2024-03-03T16:26:57+02:00
authors: ["bgtlover"]
tags:
  - notifications
  - rust
  - hacks
  - zbus
draft: false
---

ever since the [first release]({{<relref "release_0-1-0">}}), things appeared to be quite stagnant, especially from the outside. This is not an imagination of the public, this is actually true, things were quite stagnant for a while, mostly because a lot of the team was busy with real life situations. However, it appears that we have a bit more time now, so what better way to communicate this than sharing the fun with everyone, as well as, of course, the latest feature we were working on?

## introducing notifications

Notifications are the unsung heroes of a seamless desktop experience across Linux, Windows, macOS, or even smartphones. We need to stay informed about events happening around us, and traditionally, this is achieved through small pop-ups, help balloons (as Windows 7 and earlier versions called them), or tooltips that appear on the edge of our screen, alerting us to events, even when the originating application isn't in focus.
However, there's a catch:

I don't know about other operating systems, but linux doesn't offer an accessibility focused API to get most system related events, and this includes notifications. Given this, and considering the critical nature of this feature, we're left with no choice but to...

## Diving into the Hacks

In response to the absence of an accessibility dedicated API for system information in the freedesktop stack, various hacks have emerged over time. Our approach, while different in execution, isn't too far off.

In the following, we will describe the hack used by orca, since this is the only one known to do this, along with the reason we didn't do it this way. Afterwards, we will document, briefly, our own hack and why we chose this method instead

Warning: This section is quite technical. If you're not technically inclined, feel free to [skip to the limitations section](#limitations)

### orca's hack

the approach of orca is as simple as it is effective:

Most notification daemons, at least back in the day this hack was made, created a new window, with the role of alert whenever a new notification appeared. So then, that's exactly what orca does to read them. It monitors the accessibility bus for a window appeared event, it extracts the window title, and then it realises/dereferences the sender to see if it's an accessible application, and if so, if the root has the role alert. If all of those are true, the notification text is either in the window title, or in a text element which is typically the first such element in the hierarchy of accessibles from that root. The others may or may not be action buttons and other things, but that's not important to orca, so that stuff is ignored.

there are afew problems with this design though, and that's why we were not going to use it:

* this only works if the notification daemon playes by those rules, and by that I mean presenting the notification in exactly that manner. Sure, many of them do, especially those of gnome and kde, but that's because they are well aware of the situation and they implemented it in such a way that orca can use it. Other daemons, for example dunst and others, typically used in a window-manager only setup, don't do that. They can be coded to do it, sure, but then it might break their own way of presentation
* orca relies on presentation, which is known to be unstable, far more unstable than protocols. Sure, people might say that such a model of presentation will not be changed once the maintainers of the projects know that an accessibility software relies on that, but that doesn't make this method any less fragile
* we see apps become inaccessible from almost perfectly accessible a lot, especially from people who don't know anything about accessibility and who made a UI which just happens to be accessible back then. However, this absolutely can't happen for something like notifications, or other ways of reporting important system events. It is the projects maintainers responsability, to some degree, to make sure that once they know a behaviour is relied on by people, especially people who can't use their software without that aka accessibility, it's not broken in subsequent builds or feature changes, the don't break userspace daugma is as important in certain userspace system-level or desktop-level components as it is for the kernel. However, we as screenreader developers, also have a responsability to our users, to keep things as far from breaking as possible, and relying on presentation details, when something, anything better is available, is just setting our users up for greef when that breakage eventually happens, or when a component in the chosen user configuration ends up not playing by the rules outlined above

there's another reason for which we're not using this method, and it has nothing to do with limitations or design defficiencies in the previously outlined algorythm.

because odilia is a very young project, and furthermore is actively under development, well, more like on and off but still, we don't currently have the mechanisms required to handle that event, filter based on it, extract information from it, etc. We do for focus and others, but because we don't for this one, we felt it would be too much work across a longer time frame for not enough benefit currently.

### our hack

our hack relies on the [freedesktop notifications specification](https://specifications.freedesktop.org/notification-spec/notification-spec-latest.html) to be relevant and implemented by notification daemons, and is unfortunately not as simple as the one implemented by orca, but we believe it could be a bit more resiliant to change in presentation, because of the protocol itself if nothing else. It goes as follows:

* monitor the session bus for a message of type method call, using the [zbus::fdo::MonitoringProxy](https://docs.rs/zbus/latest/zbus/fdo/struct.MonitoringProxy.html) type
* map over the created stream, to convert the messages to a notification object we define earlier. This contains title, body and application_name, the rest are ignored
* iterate over the thusly obtained new stream, and speak each notification as it comes in

this approach has afew advantages compared to the previous one:

* we don't rely on presentation. Each notification daemon can present things however it wants on screen, as long as it uses the standard notification specification. Therefore, people can use any notification daemon they want, and that includes obscure ones used in very minimalist setups
* as long as the protocol remains relevant, or is used anywhere in the backend for us to be able to monitor the messages, this method will continue to function

there are, however, disadvantages with this one as well, but for the time being, we believe them to not be big enough when ballanced with not having the feature at all:

* monitoring: we are well aware sniffing the bus is not accepted as a good thing to do, and we believe we may have problems with packaging systems in the future because of this, for example flatpak. It should be only used as a development and debugging tool, we do know that, and we advice everyone who wants to do what we did to...not do it, unless there's really no way around it, but even then, think thrice at least before doing so. However, unfortunately, accessibility has to be an exception to certain things because of the "nature of the beast" so to speak, so in absence of anything better, we believe this is the less of all possible evils

## limitations

currently, we can't reliably extract the source of the notification, because most apps we tryed this with sent an empty response for that part. So, for now, odilia only says new notification, in stead of saying from which app that notification came.

We do intend to fix this in the future, if a reliable method to find that information will be discovered, we hope this will not remain broken forever. If anyone knows anything, feel free to [contact us]({{<relref "community">}}).

## how to try it

you just clone the repository, then run it:

```shell
git clone https://github.com/odilia-app/odilia
cargo install --path .
odilia
```

if you're running from a release, why would you be doing that anyway, since this is such an alpha software? you just pull main again, install and run the new version:

```shell
git checkout main
git pull
cargo install --path .
odilia
```

for more information, refere to the [installation guide]({{<relref "installation">}})

## possible issues

* on the gnome desktop, notifications might be heard twice, or in rare circumstances, not at all. This has been confirmed to happen once with notify-send, and might be inaccurate. If this is reproduceable every time, and especially if it's so with other desktops, feel free to get in touch because surely there's a way to get it fixed
* in certain cases, odilia might not exit properly when sending it a sigint, or in other words, pressing ctrl+c while it has terminal focus. If this happens to you, please do get in touch

## conclusion

it has certainly been a very fun couple of days, or maybe weeks at this point, polishing everything and making sure it's as good as possible in these conditions. Making this feature a reality took about two pull requests, if not three, working on different parts of the stack, to make sure tests correctly pass, no false negatives prevent us from merging, and actual bugs are caught instead. Hell, we did hit a very interesting exception case, which could make odilia hang on exit, and despite our efforts, may still make it do so.

many things were learned as well, especially about some previously unknown dbus mechanisms, the freedesktop notifications specification, github workflow quirks, believe it or not but x11 virtual framebuffers, and we might be missing something, but it was certainly very much fun.

Now, it's your turn to have fun! Run the new build, test it some more, lament at how weird everything is, but most important, we would be thrilled if you would talk to us about it!

as always, you are a big reason for which we keep developing odilia. Stay safe, and don't forget, you are a big force in helping us revolutionise the linux desktop, one step at a time!