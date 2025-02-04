# Oh Mighty Zsh-Maxxer,
# Before you commit the heresy of unaliving the One and Only Holy Bash,
# Grant a moment’s mercy to heed to this humble plea.
# Know ye well, that the sacred lands where the Enchanting Benevolent Lady grows fucks for thy Zsh rice have remained barren since time immemorial.

# You do have options kiddo...
setopt correct
setopt histignorealldups
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
bindkey -e                      # Emacxing

# Kernal is the source of my Energyyy...
source <(fzf --zsh)
source ~/.config/zsh/.zprofile
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# You know I have got some History...
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.config/zsh/.zsh_history

# Prompt Her before some other mf does...
PIECES=("" "" "" "" "" "")
set_prompt() {
    local virtual_env=""
    if [[ -n "$VIRTUAL_ENV" ]]; then
        virtual_env="(virt:$(basename $VIRTUAL_ENV)) "
    fi
  local piece=${PIECES[$((RANDOM % ${#PIECES[@]} + 1))]}
  PRECOL="%F{yellow}"
  COL="%F{red}"
  GREY="%F{cyan}"
  RESET="%f"
  PROMPT=" ${PRECOL}%2~${RESET} ${GREY}${virtual_env}${COL}$piece${RESET} "
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd set_prompt

# sudo Git Good now...
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{cyan}(%b)%r%f'
zstyle ':vcs_info:*' enable git\

# Never Let them know your next move...
alias v='nvim $(fzf)'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
