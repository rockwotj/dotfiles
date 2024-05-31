from ubuntu:latest

RUN apt update && apt install -y curl sudo git
RUN echo 'Testing time! Run the following commands. Do it.' > /etc/motd
RUN echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"' >> /etc/motd
RUN echo 'BINDIR=$HOME/.local/bin/ sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply rockwotj' >> /etc/motd

RUN echo "ubuntu:changeme" | chpasswd
USER ubuntu
WORKDIR /home/ubuntu


