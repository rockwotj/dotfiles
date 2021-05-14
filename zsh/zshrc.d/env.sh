if [ "$(uname)" = "Darwin" ]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk/"
fi
# TODO(rockwood): Don't assume where the repo is cloned.
if [[ -d $HOME/Workspace/dotfiles/bin ]]; then
  export PATH=$PATH:$HOME/Workspace/dotfiles/bin;
fi
export BIT_THEME=monochrome

