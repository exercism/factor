# Installing Factor

The Factor track uses **Factor 0.101**. Earlier versions are not supported.

You can either install a [nightly](#nightly) build (which tracks 0.101+ from `master`) or [build from source](#autobuild-from-source).

Verify your installation by running `factor -e='vm-version print'` — it should print `0.101` or higher.

---
### Nightly

<http://factorcode.org> provides nightly binaries under the "Development release" section. These binaries are built from git, but only builds that pass are shown.

---

### (Auto)build from source

If you want the bleeding edge and even nightly is too old for you, then you will need a modern C++ compiler (GCC >=4.8 or Clang >=3.5), `make`, and `curl`.

With those simple requirements fulfilled, you can:

1. Download the `build` shell script: [**here** for Unix-likes / POSIX shells](https://raw.githubusercontent.com/factor/factor/master/build.sh) or [**here** for Windows](https://raw.githubusercontent.com/factor/factor/master/build.cmd). Put it in the directory under which Factor should be installed. A directory called `factor` containing the codebase will be created.

2. Run it like `./build.sh install`, or `.\build.cmd install` on Windows. <sub>This will clone Factor's `git` repository, build it, and download a Factor VM image from <http://factorcode.org>. This process may take between 2 and 20 minutes, scaling with your link and clock speeds.</sub>

3. You can now run the `factor` or `factor.exe` binary generated inside the `factor` subdirectory. Try `factor --help` for help. You can also access documentation from the command line, or by pressing <kbd>F1</kbd> in the GUI Listener, which will open the help browser.

4. In the future, use the `build.sh` or (`build.cmd` on Windows) inside the `factor` subdirectory to pull from git and rebuild in-place, and download a new VM image if needed.

The file structure may now look like this:

```
.
├── build.sh                   <- delete if you like
└── factor
    ├── basis
    ├── boot.unix-x86.64.image
    ├── build.cmd              <- use these from now on
    ├── build.sh               <-
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

You no longer need the top level `build` script, as in the future the downloaded one should be used.

---

### Manually build from source (not recommended)

Clone the [repository](https://github.com/factor/factor) and use `make` in that folder.

If `make` fails with an error about a non-present target, try `make factor` or, if you can read a Makefile, find the make target for your platform in `GNUmakefile`.

If *that* fails, open an issue on [factor/factor](https://github.com/factor/factor) containing the error -- the friendly developers will be happy to help.

---

#### Stable (not recommended)

**Stable releases predate Factor 0.101 and are not supported.** Use a [nightly build](#nightly) or build from source.