alias ls="eza"
alias vi="nvim"
alias vim="nvim"


autoload edit-command-line; zle -N edit-command-line
# Press escape+v to edit the current zsh command in vim ♥︎
bindkey -M vicmd v edit-command-line
