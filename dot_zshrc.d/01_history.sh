export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000
export HISTTIMEFORMAT="[%F %T] "

setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
# setopt hist_ignore_space    # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt appendhistory          # Append history to the history file (no overwriting)
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
