#!/usr/bin/env python3

import argparse
import os
import subprocess
import shutil
import platform
import sys
import tempfile
from contextlib import contextmanager
from glob import glob
from os import path

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

def cp(src, dest):
    container = os.path.dirname(dest)
    if not os.path.isdir(container):
        os.makedirs(container)
    print("copying {} to {}".format(src, dest))
    shutil.copyfile(src, dest)

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
            "{}/nvim/init.lua.vim".format(config),
            "{}/.config/nvim/init.lua.vim".format(home))
    symlink(
            "{}/nvim/autoplugins".format(config),
            "{}/.local/share/nvim/site/pack/plugins/start".format(home))
    symlink(
            "{}/nvim/lazyplugins".format(config),
            "{}/.local/share/nvim/site/pack/plugins/opt".format(home))
    check_call(["pip3", "install", "pynvim"])
    check_call(["npm", "install", "--global", "neovim"])

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
    os.makedirs("{}/.zsh/cache/".format(home), exist_ok=True)

def alacritty(config, home):
    check_call(["mkdir", "-p", "{}/.config/alacritty/".format(home)])
    for file in ["alacritty.yml", "smoooooth.yml"]:
        symlink(
                "{}/alacritty/{}".format(config, file),
                "{}/.config/alacritty/{}".format(home, file))

def fonts(config, home):
    check_call(["mkdir", "-p", "{}/Library/Fonts".format(home)])
    for file in glob("{}/fonts/*".format(config)):
        cp(file, "{}/Library/Fonts/{}".format(home, path.basename(file)))

def bootstrap_macos():
    config = os.path.dirname(path.abspath(__file__))
    home = os.environ["HOME"]

    check_call(["brew", "bundle", "--file", path.join(config, "Brewfile")])

    git(config, home)
    tmux(config, home)
    nvim(config, home)
    zsh(config, home)
    alacritty(config, home)
    fonts(config, home)

@contextmanager
def in_tempdir():
    origin = os.getcwd()
    with tempfile.TemporaryDirectory() as tmpdir:
        try:
            os.chdir(tmpdir)
            yield
        finally:
            os.chdir(origin)

BASE_PACKAGE_LIST = [
        "curl",
        "git",
        "clang",
        "build-essential",
        "cmake",
        "tmux",
        "gh",
        "zsh",
        "software-properties-common",
        "exa",
]

def bootstrap_ubuntu():
    config = os.path.dirname(path.abspath(__file__))
    home = os.environ["HOME"]
    check_call(["sudo", "apt", "update"])
    check_call(["sudo", "apt", "install", "-y", *BASE_PACKAGE_LIST])
    if "zsh" not in os.environ["SHELL"]:
        # Set my default shell to zsh 
        check_call(["chsh", "-s", shutil.which("zsh")])
        print("Updated default shell to be zsh, please relogin to continue")
        return
    user_root = path.join(home, ".root")
    shutil.rmtree(user_root)
    os.makedirs(user_root) 
    # Install latest nvim - the apt repo is old
    with in_tempdir():
        check_call([
            "curl",
            "-SLO",
            "https://github.com/neovim/neovim/releases/download/v0.9.0/nvim.appimage",
        ])
        check_call(["chmod", "u+x", "nvim.appimage"])
        check_call(["./nvim.appimage", "--appimage-extract"])
        shutil.copytree("squashfs-root", user_root, dirs_exist_ok=True)
    zsh(config, home)

def main():
    global FLAGS
    print("Starting bootstrap...")
    FLAGS = PARSER.parse_args()

    if platform.system() == "Darwin":
        bootstrap_macos()
    elif platform.system() == "Linux":
        bootstrap_ubuntu()
    else:
        print(f"Unknown platform {platform.system()}")
        sys.exit(1)
    

    print("done!")

if __name__ == "__main__":
    main()
