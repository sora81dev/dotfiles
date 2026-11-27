nixos-rebuild list-generations > $(git rev-parse --show-toplevel)/docs/nixos-history/nixos_history-$(date +%Y_%m_%d-%H_%M_%S).txt
nh clean all --keep $1
