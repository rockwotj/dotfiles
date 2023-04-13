if [ "$(uname)" = "Darwin" ]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk/"
fi
# TODO(rockwood): Don't assume where the repo is cloned.
if [[ -d $HOME/Workspace/dotfiles/bin ]]; then
  export PATH=$PATH:$HOME/Workspace/dotfiles/bin;
fi
if [[ -d $HOME/.cargo/bin ]]; then
  export PATH=$HOME/.cargo/bin:$PATH;
fi
if [[ -d $HOME/.root/npm-packages/bin ]]; then
  export PATH=$HOME/.root/npm-packages/bin:$PATH;
fi
if [[ -d $HOME/.root/npm-packages/share/man ]]; then
  export MANPATH="${MANPATH-$(manpath)}:$HOME/.root/npm-packages/share/man"
fi
if [[ -d $HOME/.root/usr/bin ]]; then
  export PATH=$HOME/.root/usr/bin:$PATH;
fi
if [[ -d $HOME/.bin ]]; then
  export PATH=$HOME/.bin:$PATH;
fi
export BIT_THEME=monochrome

# https://cloud.google.com/iap/docs/using-tcp-forwarding#increasing_the_tcp_upload_bandwidth
export CLOUDSDK_PYTHON_SITEPACKAGES=1

ulimit -n 1048576

# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
# Simple but maybe we should play with something else?
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
