## Why I made This

I searched the internet for long amounts of time to find various answers to parts of the problem scattered across random virus blogs, stack overflow,
and the documentation so I made my own repo explaining how this works for anyone interested in not using CMake.

## Meson with Vim

So essentially you can create a compile_commands.json and coc-vim will pick up that file and allow you to use external libraries in auto completion.
For some reason this works by default in vscode but you must move compile_commands.json to your src file in vim. This is somwhat annoying but I can
deal with it, you can generate this file using the command: `ninja -t compdb -x c_COMPILER cpp_COMPILER > compile_commands.json`

## Meson is the superior build system

Meson allows you to just use external deps without having to compile libraries from source and learn a whole new language like with CMake Meson is also
cross platform and open source, the only issue is that there aren't as many examples out there of using Meson so it can be somewhat hard to figure how
to do something with Meson without reading docs and putting it together by yourself. The way that this is written is very similar to something like
cargo with rust, you simply just tell meson what dependencies you would like to use and it will just work, dynamic linking works by default without
invoking pkg-config and using `meson wrap install [some library]` is super easy, and feels way better than writting 100 lines of CMake and trying
to compile gtest from source or something like that, Bazel also exits but I don't really know anything about it. Meson is also officially supported by
Gnome and GTK and I just happen to be writing those applications so that's also a good thing. Now how meson wrap works:

```sh

mkdir -p subprojects
meson install gtest
meson --reconfigure build/

# some virus blog I can't find the link to but probably also in the documentation

```

meson will search for subprojects folder to put the gtest.wrap file into. Then you run reconfigure to reconfigure your project with this new subproject 
keep in mind these commands are run at the project root.


```python

# meson.build inside of /src/

gtest = subproject('gtest') # name of the wrap
gtest_dep = gtest.get_variable('gtest_dep') # name of deps variable is [library]_dep

executable('project', sources,
	dependencies: [gtest_dep],
	install true)
	
# the documentation https://mesonbuild.com/Subprojects.html

```

This is basicly just linking deps to the executable.
