# Coding templates

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
