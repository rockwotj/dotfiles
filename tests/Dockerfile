from ubuntu:latest

RUN apt update && apt install -y curl sudo git

RUN echo "ubuntu:changeme" | chpasswd
USER ubuntu
WORKDIR /home/ubuntu

RUN echo '# Testing time! Run the following commands. Do it.' > test.sh
RUN echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"' >> test.sh
RUN echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> test.sh
RUN echo 'BINDIR=$HOME/.local/bin/ sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply rockwotj' >> test.sh

