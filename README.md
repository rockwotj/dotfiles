Install instructions
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
BINDIR=$HOME/.local/bin/ sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply rockwotj
```
