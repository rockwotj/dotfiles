fpath[1,0]=~/.zsh/completion/
mkdir -p ~/.zsh/cache

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit
