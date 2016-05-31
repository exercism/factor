To install Factor, you have a couple of choices.

For production servers and mission-critical applications, we recommend a stable binary release from the homepage, but because all commits and pulls are thoroughly tested and carefully reviewed, the nightly builds and even the bleeding edge of `git` are quite safe.

---

### Stable

Download a binary for your platform from <http://factorcode.org>, and run the installer.

These binaries and sources are typically a few months behind `git`, so if you want the latest bugfixes and features (dark mode UI, perhaps?) then see the "all platforms" section below, to obtain the up-to-the-minute version.

If your platform isn't listed on that page (i.e. not one of Windows, Linux or Mac) then there's no guarantee Factor will build and run for you. You can still try building directly from source; see below.

---
### Nightly

The website also provides nightly binaries, built from git. Only builds that pass are shown.

---

### (Auto)build from source

If neither of the above options are good enough for you, and you need all the latest tech, then:

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

Not recommended as things can go wrong too easily, but this may be your only option. In most cases, a simple `make` should suffice.