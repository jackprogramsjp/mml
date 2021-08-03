# mml
Modern Memory Language Compiler

## What is Modern Memory Language?

## Binary Distributions

MML works with:
* Windows (x86_64, and i386/x86)
* Linux (x86_64, i386/x86, and arm64)

Currently, there are no binary distributions for MacOS, but you can instead build from source (which shouldn't be too hard); it will involve with the terminal though.

### Installing in Windows

Options to install MML in Windows (only pick one option):
* [Chocolatey](https://chocolatey.org/): `choco install mml`
* Powershell: Currently, none.

### Installing in Linux

Options to install MML in Linux (only pick one option):
* [Snap](https://snapcraft.io/): `sudo snap install mml`
* Shell: Currently, none.

## Building from source
MML is written in OCaml (OCaml 4.11.2 is required).

1. Install system dependencies:
   * Windows: [OCaml for Windows docs](https://fdopen.github.io/opam-repository-mingw/installation/), or [Cygwin](https://cygwin.com/) with dependencies like `gcc`, `make`, etc.
   * MacOS: `brew install opam`
   * Debian/Ubuntu: `sudo apt-get install opam`
     * Other Linux: See [opam docs](https://opam.ocaml.org/doc/Install.html)

## How Releases work

We publish alpha, beta, release candidates, and full releases.

1. A `-a` after the version number is in alpha stage.
1. A `-b` after the version number is in beta stage.
1. A `-rc` after the version number is a release candidate.

--------------------

Alpha release means the software is incomplete or partially complete.

Beta release means the software is fully completed, but could still contain bugs or performance issues.

Release candidate is a beta version with the potential of being released as a stable product, unless significant
bugs emerge.

--------------------

Binary distributions will only be made for Linux users if in alpha stage.

Binary distributions will be made for other operating systems (and Linux of course) if in beta stage or later.

We will soon allow users to report bugs.
