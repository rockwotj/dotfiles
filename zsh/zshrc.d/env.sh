if [ "$(uname)" = "Darwin" ]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk/"
fi
# TODO(rockwood): Don't assume where the repo is cloned.
if [[ -d $HOME/Workspace/dotfiles/bin ]]; then
  export PATH=$PATH:$HOME/Workspace/dotfiles/bin;
fi
if [[ -d $HOME/.bin ]]; then
  export PATH=$HOME/.bin:$PATH;
fi
if [[ -d $HOME/.root/usr/bin ]]; then
  export PATH=$HOME/.root/usr/bin:$PATH;
fi
export BIT_THEME=monochrome

# https://cloud.google.com/iap/docs/using-tcp-forwarding#increasing_the_tcp_upload_bandwidth
export CLOUDSDK_PYTHON_SITEPACKAGES=1

