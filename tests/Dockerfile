from ubuntu:latest

RUN apt update && apt install -y curl sudo git

RUN echo "ubuntu:changeme" | chpasswd
USER ubuntu
WORKDIR /home/ubuntu

# RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# RUN BINDIR=$HOME/.local/bin/ sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply rockwotj

