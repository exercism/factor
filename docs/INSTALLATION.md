# Installing Factor, and making Factor and Exercism play nice

[**Even if you already have Factor installed, you still need to read the last section of this document for important information about testing Factor code in the Exercism environment.**](#play-nice)

---

## Installing Factor

To install Factor, you have a couple of choices.

For production servers and mission-critical applications, we recommend a stable binary release from the homepage, but because all commits and pulls are thoroughly tested and carefully reviewed, the [nightly builds](#nightly) and even the [bleeding edge of `git`](#autobuild-from-source) are quite safe.

---

### Stable

Download a binary for your platform from <http://factorcode.org>, and run the installer.

These binaries and sources are typically a few months behind `git`. If you want the latest bugfixes and features (dark mode UI, perhaps?), or if your platform isn't listed on that page (i.e. not Windows, Linux or Mac), then see the ["build from source"](#autobuild-from-source) section below, to obtain the up-to-the-minute version.

---
### Nightly

The website also provides nightly binaries, built from git. Only builds that pass are shown.

---

### (Auto)build from source

If neither of the above options are good enough for you, and you need all the latest tech, then you will need a modern C++ compiler like GCC >=4.8 or Clang >=3.5, `make`, `curl`, and:

1. Download the `build` shell script: [**here** for `sh`, `bash`, etc](https://raw.githubusercontent.com/factor/factor/master/build.sh) or [**here** for Windows](https://raw.githubusercontent.com/factor/factor/master/build.cmd). Put it in the directory where Factor should be installed.
2. Run it with the `install` argument: `./build.sh install`, or `.\build.cmd install` on Windows. This will clone Factor's `git` repository, build it, and download a Factor VM image from <http://factorcode.org>. This process will take between 2 and 20 minutes, depending on the speed of your internet connection and processor.
3. You can now run the generated `factor` or `factor.exe` binary. Try `factor --help` for help. You can also access documentation from the command line, or by pressing <kbd>F1</kbd> in the GUI Listener, which will open the docs browser.
4. In the future, just `cd` into Factor's cloned repository and type `./build.sh update` or `.\build.cmd update`, respectively, to pull from git and rebuild in-place, and download a new VM image if the checksums differ.

Your tree, from the working directory of the original build script, might look something like this:

```
.
├── build.sh
└── factor
    ├── basis
    ├── boot.unix-x86.64.image
    ├── boot.unix-x86.64.image.bak
    ├── build.cmd
    ├── build.sh
    ├── checksums.txt
    ├── core
    ├── extra
    ├── factor
    ├── Factor.app
    ├── factor.bak
    ├── factor.image
    ├── factor.image.bak
    ├── factor.image.fresh
    ├── GNUmakefile
    ├── key-log.txt
    ├── libfactor.a
    ├── libfactor-ffi-test.so
    ├── LICENSE.txt
    ├── logs
    ├── misc
    ├── Nmakefile
    ├── README.md
    ├── unmaintained
    ├── vm
    └── work
```

You no longer need the top level buildscript.

---

### (Actually) Build from source

Not recommended as the buildscripts are quite good at touchlessly setting things up, but this may be your only option. In most cases, a simple `make` should suffice.

If `make` fails with an error about a non-present target, try `make factor` or, if you can read a Makefile, find the make target for your platform in `GNUmakefile`.

If *that* fails, open an issue on [factor/factor](https://github.com/factor/factor) containing the error -- the friendly developers will be happy to help.

---

## Making Exercism and Factor work together <a name="play-nice"> </a>

Name clashes between Exercism and the Factor standard library, Exercism and Factor's mutual strictness about filenames, and Factor's reluctance to find vocabularies outside its source tree are all **factor**s making it kind of tricky for Exercism users to test their Factor code.

A [wrapper vocabulary](https://github.com/catb0t/exercism.factor) has been written to streamline the Factor workflow in an Exercism context. This vocab allows users like you, and xfactor contributors alike, to use the `tools.test` framework to write tests in a familiar way, but automating and eliminating the manual configuration which was otherwise necessary.

To test your Factor code in your `exercism/factor` folder, just download [exercism.factor](https://github.com/catb0t/exercism.factor/archive/master.zip) and unzip it somewhere Factor can find it. `resource:work/exercism` is a good choice, so `testing.factor` is `resource:work/exercism/testing/testing.factor`.

For information on using `exercism.testing`, refer to the [testing documentation](exercism.io/languages/factor#test), or to `exercism.testing`'s documentation by running `"exercism.testing" help` in Factor.