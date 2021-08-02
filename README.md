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

