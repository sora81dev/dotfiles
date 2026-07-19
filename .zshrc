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

# eza
alias l="ls"
alias ls="eza --group-directories-first"
alias lg="eza --group-directories-first --git-ignore"
alias lag="eza --group-directories-first -la --git-ignore"
alias la="eza --group-directories-first -la"
