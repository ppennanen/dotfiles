# dotfiles




## Install dotfiles

Install with [chezmoi](https://www.chezmoi.io/)


```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply ppennanen
```

## Tools

### macos

Install homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Tools are listed in `~/.local/share/chezmoi/.chezmoidata/packages.yaml`.
Install with `chezmoi apply`.

