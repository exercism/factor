# Installing Factor, and making Factor and Exercism play nice

[**Even if you already have Factor 0.98 installed, you still need to read the last section of this document for important information about testing Factor code in the Exercism environment.**](#play-nice)

---

## Installing Factor

To install Factor, you should use a [nightly](#nightly) or [bleeding-edge](#autobuild-from-source) build.

***The last stable release of Factor was [0.97 released 2 Nov 2014](https://re-factor.blogspot.com/2014/11/factor-097-now-available.html) -- this is quite out of date and not recommended.***

---
### Nightly

<http://factorcode.org> also provides nightly binaries, built from git. Only builds that pass are shown.

---

### (Auto)build from source

If neither of the above options are good enough for you, and you need all the latest tech, then you will need a modern C++ compiler like GCC >=4.8 or Clang >=3.5, `make`, `curl`, and:

1. Download the `build` shell script: [**here** for Unix-likes / POSIX shells](https://raw.githubusercontent.com/factor/factor/master/build.sh) or [**here** for Windows](https://raw.githubusercontent.com/factor/factor/master/build.cmd). Put it in the directory where Factor should be installed.

2. Run it like `./build.sh install`, or `.\build.cmd install` on Windows. <sub>This will clone Factor's `git` repository, build it, and download a Factor VM image from <http://factorcode.org>. This process will take between 2 and 20 minutes, depending on the speed of your internet connection and processor.</sub>

3. You can now run the generated `factor` or `factor.exe` binary. Try `factor --help` for help. You can also access documentation from the command line, or by pressing <kbd>F1</kbd> in the GUI Listener, which will open the docs browser.

4. In the future, just `cd` into Factor's installation and type `./build.sh update`, or `.\build.cmd update` on Windows, to pull from git and rebuild in-place, and download a new VM image if one exists.

The file structure may now look like this:

```
.
├── build.sh
└── factor
    ├── basis
    ├── boot.unix-x86.64.image
    ├── build.cmd
    ├── build.sh
    ├── core
    ├── extra
    ├── factor
    ├── Factor.app
    ├── factor.image
    ├── GNUmakefile
    ├── libfactor.a
    ├── libfactor-ffi-test.so
    ├── LICENSE.txt
    ├── misc
    ├── Nmakefile
    ├── README.md
    ├── unmaintained
    ├── vm
    └── work
```

You no longer need the top level `build.sh`.

---

### Manually build from source

Clone the [repository](https://github.com/factor/factor) and use `make` in that folder.

If `make` fails with an error about a non-present target, try `make factor` or, if you can read a Makefile, find the make target for your platform in `GNUmakefile`.

If *that* fails, open an issue on [factor/factor](https://github.com/factor/factor) containing the error -- the friendly developers will be happy to help.

---

#### Stable (not recommended)

**Note that [the automated test framework](languages/factor/tests) for Factor exercises on Exercism requires at least a [nightly build](#nightly)**.

If you *don't* want automated testing or thousands of new features and bugfixes, download a Stable release binary for your platform from <http://factorcode.org>, and run the installer.

---

## Making Exercism and Factor work together <a name="play-nice"> </a>


Due to limitations like name clashes and filename disagreements, it's rather difficult to use `tools.test` on Exercism exercises out of the box.

Instead, there is a [wrapper vocabulary](https://github.com/catb0t/exercism.factor) for the Factor workflow in an Exercism context. Users and Exercism maintainers alike can write tests in a familiar way, with much less overhead.

To test your Factor solutions in your `exercism/factor` folder, follow the directions in [the README](https://github.com/catb0t/exercism.factor#getting-started).

For information on using `exercism.testing`, refer to the [testing documentation](exercism.io/languages/factor#test), or to `exercism.testing`'s documentation by running `"exercism.testing" help` in Factor.