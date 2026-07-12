# Python
alias python="python3"
alias pip="pip3"

# Add PATH
export PATH="$HOME/.nix-profile/bin:$PATH"

# Load Original Commands
for f in $HOME/.config/commands/*(N-.); do source "$f"; done

# Colors
eval "$(dircolors -b)"
LS_COLORS=$LS_COLORS':tw=0:ow=0:st=0'
export LS_COLORS

# ZSH Autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"

# ghq
export GHQ_ROOT=~/ghq

# GPG Key
export GPG_TTY=$(tty)

# Pure
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
