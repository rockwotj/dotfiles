# https://github.com/junegunn/fzf?tab=readme-ov-file#respecting-gitignore
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'

alias vi="nvim"
alias vim="nvim"
export EDITOR=nvim
export GH_EDITOR=nvim
autoload edit-command-line; zle -N edit-command-line
# Press escape+v to edit the current zsh command in vim ♥︎
bindkey -M vicmd v edit-command-line
