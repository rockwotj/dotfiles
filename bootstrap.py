#!/usr/bin/env python3

import argparse
import os
import subprocess

PARSER = argparse.ArgumentParser(description = "Bootstrap personal config")
PARSER.add_argument(
        "-f",
        "--force",
        action = "store_true",
        help = "overwrite existing config files?",
        dest = "force",
        default = False)

def symlink(src, dest):
    container = os.path.dirname(dest)
    if not os.path.isdir(container):
        os.makedirs(container)
    elif os.path.lexists(dest):
        if os.path.realpath(dest) == src:
            print("{} already set up correctly, skipping...".format(dest))
            return
        elif FLAGS.force:
            os.remove(dest)
        else:
            raise Exception("{} already exists, use -f to overwrite".format(dest))
    print("symlinking {} to {}".format(src, dest))
    os.symlink(src, dest)

def check_call(cmd):
    print("running {}...".format(" ".join(cmd)))
    subprocess.check_call(cmd)


def git(config, home):
    symlink(
            "{}/git/gitconfig".format(config),
            "{}/.gitconfig".format(home))
    symlink(
            "{}/git/gitignore_global".format(config),
            "{}/.gitignore_global".format(home))

def tmux(config, home):
    symlink(
            "{}/tmux/tmux.conf".format(config),
            "{}/.tmux.conf".format(home))

def nvim(config, home):
    symlink(
            "{}/nvim/vimrc".format(config),
            "{}/.config/nvim/init.vim".format(home))
    symlink(
            "{}/nvim/autoplugins".format(config),
            "{}/.local/share/nvim/site/pack/plugins/start".format(home))
    symlink(
            "{}/nvim/lazyplugins".format(config),
            "{}/.local/share/nvim/site/pack/plugins/opt".format(home))

def zsh(config, home):
    symlink(
            "{}/zsh/zshrc".format(config),
            "{}/.zshrc".format(home))
    symlink(
            "{}/zsh/zshrc.d".format(config),
            "{}/.zshrc.d".format(home))
    # This needs to be be on your $fpath
    symlink(
            "{}/zsh/completion".format(config),
            "{}/.zsh/completion".format(home))
    check_call(["mkdir", "-p", "{}/.zsh/cache/".format(home)])

def hg(config, home):
    symlink(
            "{}/hg/hgrc".format(config),
            "{}/.hgrc".format(home))

def main():
    global FLAGS
    print("Starting bootstrap...")
    FLAGS = PARSER.parse_args()

    config = os.path.dirname(os.path.abspath(__file__))
    home = os.environ["HOME"]

    git(config, home)
    tmux(config, home)
    nvim(config, home)
    zsh(config, home)
    hg(config, home)

    print("done!")

if __name__ == "__main__":
    main()
