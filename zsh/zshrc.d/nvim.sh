alias vim=nvim
alias vi=nvim
export EDITOR=nvim
export GH_EDITOR=nvim
export VISUAL=nvim

autoload edit-command-line; zle -N edit-command-line
# Press escape+v to edit the current zsh command in vim ♥︎
bindkey -M vicmd v edit-command-line
