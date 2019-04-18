# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

set -o vi

# zsh-autosuggestion
# https://goo.gl/jb1Fs4
# should be after "set -o vi"
bindkey '^q' autosuggest-accept
bindkey '^[[[CE' autosuggest-execute
# http://stratus3d.com/blog/2017/10/26/better-vi-mode-in-zshell/
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd '/' history-incremental-search-backward
bindkey -M vicmd '?' history-incremental-search-forward
bindkey -M viins '^s' history-incremental-search-backward
bindkey -M vicmd '^f' vi-insert
bindkey -M viins '^f' vi-cmd-mode
# shift tab
bindkey '^[[Z' reverse-menu-complete
export KEYTIMEOUT=1

