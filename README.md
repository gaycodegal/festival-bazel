# Festival compiled with Bazel

I'm just trying to have an easy time of making Festival work on mobile and the major OS at the same time. Thus, I'm building festival with bazel. I've got the tools from `//speech_tools/main building`, and this means libestbase, libeststring, and libestools all are building correctly. I needed these libraries to build for festival to be built. Basically all that's special about this project is in the `//bzl` folder. 

I've also got `//festival/src/main:festival` building but unfortunately it is trying to call audsp and dying. I'm pretty sure its based on how I built it; I must have messed up on the defines somewhere, probably with AlsaMixer. 

`rules_fest.bzl` helps me make the festival make files work (still haven't yet set it up to deal with things like the ALSA optional parameters), and `rules_cc_object.bzl` helps me compile object files without producing a `.a` library file. 

Festival is compiled first to object files and then we pick and choose amongst those files to build 3 libraries. This was not my choice of compilation strategy, but with cc_object, we can stay true to the intended method of compiling festival with minimal effort.

## Who wrote it?

- https://github.com/festvox/festival
- https://github.com/festvox/speech_tools

## Licensing

Its complicated, you can count any work done by me for this project as falling under the original license (which basically is your standard X11-ish license), but there are the occasional files that fall under different copyright licenses. I'm trusting the source license that says there's no commercial restrictions.

If I'm feeling up to it maybe I'll eventually separate my bazel files from the surrounding festival files so I can just link against the festival source properly, but don't count on it. All i really want to do is get this compiling and onto a phone so I can have a screen reader I can control programmatically cross platform.
