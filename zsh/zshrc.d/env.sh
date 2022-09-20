if [ "$(uname)" = "Darwin" ]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk/"
fi
if [[ -d /usr/local/opt/ruby/bin ]]; then
  export PATH="/usr/local/opt/ruby/bin:$PATH"
fi
# TODO(rockwood): Don't assume where the repo is cloned.
if [[ -d $HOME/Workspace/dotfiles/bin ]]; then
  export PATH=$PATH:$HOME/Workspace/dotfiles/bin;
fi
if [[ -d $HOME/.bin ]]; then
  export PATH=$PATH:$HOME/.bin;
fi
export BIT_THEME=monochrome

