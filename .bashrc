# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Garuda defaults (package garuda-bash-config): starship prompt, eza/bat aliases,
# pacman helpers. They follow system updates; everything below overrides them.
[ -f /usr/share/garuda/garuda-bash-config/bashrc ] && source /usr/share/garuda/garuda-bash-config/bashrc

# -- Overrides below this line --

# Prompt: plain [user@host dir]$ instead of the starship prompt loaded by Garuda
if declare -F starship_precmd >/dev/null; then
  PROMPT_COMMAND=${PROMPT_COMMAND//starship_precmd;/}
  PROMPT_COMMAND=${PROMPT_COMMAND//starship_precmd/}
  trap - DEBUG
fi
PS1='[\u@\h \W]\$ '
PS2='> '

export PATH="$HOME/usr/bin:$HOME/.local/bin:$PATH"

alias rm="rm --verbose --interactive=once"
alias cd="cd -P"

alias vim="nvim -p"
alias vd="nvim -dO"

alias ll="eza -lah --icons=always --git-repos --git -T -L 2"

printf "\e[5 q"
fastfetch -l garuda

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

if ! pgrep -u "$USER" ssh-agent >/dev/null; then
  eval "$(ssh-agent -s)" >/dev/null
  ssh-add ~/.ssh/github/phamnam2003 2>/dev/null
fi

# golang
[ -d /usr/local/go/bin ] && export PATH=$PATH:/usr/local/go/bin
command -v go >/dev/null && export PATH=$PATH:$(go env GOPATH)/bin

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
