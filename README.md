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

Install tools

```sh
xargs brew install < .config/brew-leaves.txt
```

Update list of current tools

```
brew leaves > .config/brew-leaves.txt 
chezmoi add  .config/brew-leaves.txt
```

