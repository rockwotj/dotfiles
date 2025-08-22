Install instructions
```
sudo apt install git build-essential
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
BINDIR=$HOME/.local/bin/ sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply rockwotj
echo '/home/linuxbrew/.linuxbrew/bin/zsh' | sudo tee /etc/shells
sudo chsh --shell /home/linuxbrew/.linuxbrew/bin/zsh rockwood
infocmp -x xterm-ghostty | ssh YOUR-SERVER -- tic -x -
# For GCP VM
# infocmp -x xterm-ghostty | gcloud compute ssh dev --zone=us-central1-b -- tic -x -
gh auth login
(cd ~/.local && python3 -m venv venv && ./venv/bin/pip install pynvim)
npm install -g neovim basedpyright
```
