# Nix Dev Shells

Nix-shells ready to be copied for starting new projects in various programming languages.

## How to use

Copy the desired directory to a new location then cd into it and enter the shell.
```bash
nix-shell
```

Nix-shell uses bash by default, to use a different shell:
```bash
nix-shell --run 'zsh'
nix-shell --run 'fish'
```

To set this as default behavior:
```bash
alias nix-shell="nix-shell --run '<shell>'"
```

## Available shells

- [python](./python) - A nix-shell template for python projects.
- [arduino](./arduino) - A nix-shell template for arduino projects, specifically ESP32.
- [maven](./maven) - A nix-shell template for java maven projects.
- [cmake-basic](./cmake-basic) - A basic nix-shell template for basic executables coded in C using cmake.
- [cmake-adv](./cmake-adv) - An advanced nix-shell template for creating libraries in C using cmake.
- [jupyter](./jupyter) - A nix-shell template for handling jupyter .ipynb files and to code either within jupyter-notebook or nvim with nvim-molten.
- [PyQt5](./PyQt5) - A nix-shell template for PyQt5 projects.

## Python

Python has many problems on NixOS because pip modules often depend on libraries that aren't findable by default.


As such, the nix-shells that involve python use [nix-ld](https://github.com/nix-community/nix-ld) along with [uv](https://docs.astral.sh/uv/) to help with library resolution.


If you need a library that isn't within the template, please check the [nix-ld libraries list](./nix-ld-libraries.md).
