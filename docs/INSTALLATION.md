# Installing Factor, and making Exercism and Factor play nice

[**Even if you already have Factor installed, you still need to read the last section of this document for important information about Factor's relationship with Exercism.**](#making-factor-and-exercism-play-nice)

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

Not recommended as things can go wrong too easily, but this may be your only option. In most cases, a simple `make` should suffice.

---

## Making Exercism and Factor play nice

Before you go any further, we need to talk about Factor's directory structure.

When you bootstrap a new vocabulary from the Factor listener:
```
( scratchpad ) USE: tools.scaffold
Loading resource:basis/tools/scaffold/scaffold.factor
Loading resource:basis/tools/scaffold/scaffold-docs.factor
( scratchpad ) "new-vocab" scaffold-work
```
you are creating a new directory in `place-factor-is-installed/work/new-vocab`, containing the file `new-vocab.factor`. `core`, `basis`, `extra`, `misc`, and `unmaintained` are all default vocabulary root paths in `place-factor-is-installed`, and most of them need to exist for Factor to run. `work` just happens to hold *your* personal vocabulary projects. Factor does not, by default, look for vocabularies to load outside of these roots.

On the other hand, Exercism's directory for exercises is in a directory in your home folder. `C:\Users\You\exercism\` on Windows, or `~/exercism` on Unicies. See the problem?

There is a disparity between where Factor wants your code and where Exercism wants your code. Happily, however, there are a few solutions.

The cleanest, preferred solution, if your platform / filesystem is capable of [hard links](http://enwp.org/Hard_link), is:

1. Run in the listener: `USE: tools.scaffold "exercism" scaffold-work`
2. a [hard link](http://enwp.org/Hard_link) between `~/exercism/factor` and the new `place-factor-is-installed/work/exercism`. GNU Coreutils `ln` creates hard links by default, so `ln ~/exercism/factor place-factor-is-installed/work/exercism` should do the job.
3. Now, Exercism problems folders will be used as Factor sub-vocabularies of the `exercism` vocabulary.

**Remember, deleting something on one end of the hard link will delete the object on the other end!** Symbolic links are one-way, but hard links are not, so be careful.

An example:

```
your-home-directory
│
├── exercism
│   └── factor           <-------------------+
│       └── hello-world                      |
│           ├── hello-world.factor           |
│           └── hello-world-tests.factor     |
└── factor                                   |
    ├── basis                                |- hard linked!
    ├── core                                 |
    ├── extra                                |
    ├── misc                                 |
    └── work                                 |
        └── exercism     <-------------------+
            └── hello-world
                ├── hello-world.factor
                └── hello-world-tests.factor
```

If you're not blessed with hard links, then you can use one of the three other methods mentioned in the [Factor documentation on this](http://docs.factorcode.org/content/article-add-vocab-roots.html).

1. Use an environment variable. Factor looks at the `FACTOR_ROOTS` environment variable for a list of paths, separated by `:` on Unicies, `;` on Windows, or whatever your path separator is. This means:
  * `export FACTOR_ROOTS="home/you/exercism/factor:another/directory"` in your `.bashrc` or equivalent
  * On Windows, changing your user's enivronment variables to set `FACTOR_ROOTS` to `C:\Users\You\exercism\factor;C:\Another\Directory`.

2. Create a configuration file. You can list additional vocabulary roots in a file read by Factor at startup: [Additional vocabulary roots file](http://docs.factorcode.org/content/article-.factor-roots.html)

3. Call the [add-vocab-root](http://docs.factorcode.org/content/word-add-vocab-root%2Cvocabs.loader.html) word from your [.factor-rc file](http://docs.factorcode.org/content/article-.factor-rc.html).