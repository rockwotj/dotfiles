from ubuntu:latest

RUN NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME

