
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit


# PATH
export PATH="$HOME/.local/bin:$PATH"
if command -v go >/dev/null 2>&1; then
  export PATH="$PATH:$(go env GOPATH)/bin"
fi

export EDITOR="nvim"
export VISUAL="nvim"

# Starship prompt
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# fzf
source <(fzf --zsh)
export FZF_COMPLETION_TRIGGER='?'
export FZF_DEFAULT_COMMAND='fd --type f --type d --hidden --exclude .git --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"



# Auto completion
zstyle ":completion:*:*:*:*:*" menu select
zstyle ":completion:*" special-dirs true
zstyle ":completion:*" squeeze-slashes true
zstyle ":completion:*" file-sort change
zstyle ":completion:*" matcher-list "m:{[:lower:][:upper:]}={[:upper:][:lower:]}" "r:|=*" "l:|=* r:|=*"

setopt SHARE_HISTORY

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
bindkey -s "^y" "y\n"


## Clash Proxy Configuration Switch
function clash() {
    if [ -n "$http_proxy" ]; then
        unset http_proxy https_proxy all_proxy no_proxy
        printf "\033[31m✘ Clash off \033[0m\n"
    else
        export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
        export http_proxy="http://127.0.0.1:7890"
        export https_proxy=$http_proxy
        export all_proxy=socks5://127.0.0.1:7890
        curl  -s -XGET "http://ip-api.com/json" | jq
        printf "\033[32mProxy On\033[0m\n"
    fi
}


# Using fzf as interactive Ripgrep launcher
function rgf() {
    RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
    INITIAL_QUERY="${*:-}"

    fzf --ansi --disabled --query "$INITIAL_QUERY" \
        --color=bg:#000000,bg+:#3b4a6b \
        --bind "start:reload:$RG_PREFIX {q} || true" \
        --bind "change:reload:sleep 0.2; $RG_PREFIX {q} || true" \
        --delimiter : \
        --preview 'bat --theme="gruvbox-dark" --color=always {1} --highlight-line {2}' \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
        --bind 'enter:become(nvim {1} +{2})'
}


# Aliases
alias vim="nvim"
alias ll="eza -la --icons --group-directories-first"
alias l="eza -la --icons --group-directories-first"
alias la="eza -a --icons --group-directories-first"
alias lt="eza --tree --icons --group-directories-first"
alias f="fzf"
alias fp="fzf --style full --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}'"


# zsh plugins: autosuggestion, syntax-highlighting
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fast Node Manager (fnm) - Node.js version manager (direct loading for stability)
eval "$(fnm env --use-on-cd)"

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"



