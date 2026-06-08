#! /bin/zsh

# grg commands
# --------------
# Description: This command finds valid ghq repository with fuzzy-finder.
# Created at : 2026.06.08
# Updated at : 2026.06.08

grg() {
  local OPTIND
  local selected dir
  local lsopts="-la"
  
  while [ $# -gt 0 ]; do
    case "$1" in
      -h|--help)
        sed 's/^        //' <<< "Usage: grg [OPTIONS]

        Options:
          -c, --compact   Compact mode
          -h, --help      Show this help
        "
        return 0
        ;;
      -c|--compact)
        lsopts=""
        shift
        ;;
      -*)
        echo "grg: invalid option -- '$1'"
        return 1
        ;;
      *)
        break
        ;;
    esac
  done

  selected=$(ghq list | sed 's|^github.com/||' \
    | fzf --layout=reverse --border \
          --preview 'ls '"$lsopts"' "$(ghq root)/github.com/"{}')

  [ -n "$selected" ] || return

  dir=$(ghq list -p "github.com/$selected")
  [ -d "$dir" ] || return

  cd "$dir" || return

  pwd
}
