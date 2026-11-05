# Agent guide (dotfiles)

Personal NixOS + Home Manager flake for user `sora81dev`. Desktop: **Niri** on Wayland (not GNOME/KDE).

## Apply changes

| Target | Command |
|--------|---------|
| NixOS + home (this machine) | `sudo nixos-rebuild switch --flake /home/sora81dev/dotfiles#hp-notebook` |
| Home only (non-NixOS) | `home-manager switch --flake /home/sora81dev/dotfiles#sora81dev` |
| Preferred wrapper | `nh os switch` / `nh home switch` (`programs.nh` → flake at `/home/sora81dev/dotfiles`) |

After editing **system** modules under `nixos/modules/` or `configuration.nix`, use **nixos-rebuild**. After **home** programs/packages only, rebuild still goes through the same flake on NixOS (home-manager is embedded in the NixOS config).

## Repository layout

```
flake.nix                 # hp-notebook + homeConfigurations.sora81dev
nixos/
  configuration.nix       # System imports, users, boot, timezone
  modules/                # NixOS system modules (audio, network, keyboard, desktop…)
  machines/hp-notebook/   # hardware-configuration.nix (only host today)
  home/
    shared.nix            # Entry: nixos.nix vs home-manager.nix by isNixOS
    nixos.nix             # Home on NixOS (packages, udiskie, imports programs/)
    programs/             # One dir per app → home-manager options + xdg symlinks
    packages/             # home.packages lists
    development/          # Zephyr, AI tooling, etc.
    build-packages/       # Custom derivations (callPackage from programs)
niri/                     # Niri KDL → ~/.config/niri (via home programs/niri)
nvim/                     # Neovim lua → ~/.config/nvim
fcitx5/                   # IME config → ~/.config/fcitx5
ghostty/                  # Extra ghostty assets (main config in home-manager)
commands/                 # User shell helpers (not auto-installed; reference only)
archive/                  # Old configs; do not wire without asking
```

**Split rule:** system services and hardware → `nixos/modules/` + `configuration.nix`. User apps, dotfiles, CLI → `nixos/home/`.

**Plain-tree dotfiles** (`niri/`, `nvim/`, `fcitx5/`) are deployed with `xdg.configFile.*.source` from Nix; edit the tree in-repo, then rebuild.

## Where to change what

| Topic | Look here |
|-------|-----------|
| PipeWire / audio | `nixos/modules/audio.nix` |
| Bluetooth | `nixos/modules/bluetooth.nix` |
| Niri / portal / waybar | `nixos/modules/desktop-configuration.nix`, `nixos/modules/programs/niri/` |
| Keyboard (system) | `nixos/modules/keyboard.nix` |
| Keymaps (Niri) | `niri/keymap.kdl`, `niri/config.kdl` |
| Discord, GUI apps | `nixos/home/programs/gui-common-softwares.nix` |
| Fcitx5 / Mozc | `nixos/home/programs/fcitx5/`, `fcitx5/` |
| Ghostty | `nixos/home/programs/ghostty/default.nix` |
| Neovim | `nvim/`, `nixos/home/programs/nvim/default.nix` |

## Environment notes (troubleshooting)

- **Audio:** PulseAudio disabled; **PipeWire** + `wireplumber`. Tools: `wpctl`, `pavucontrol` (in system packages).
- **Discord mic silent but device works:** In pavucontrol **Recording**, check **WEBRTC VoiceEngine** stream volume (not just the mic source). `wpctl get-volume` on the Discord capture stream; `0.00` → set to `1.0`.
- **HP OmniBook internal mics:** Prefer **Digital Microphone**; **Stereo Microphone** may capture silence on this hardware.
- **User groups** (in `configuration.nix`): no `audio` group; session PipeWire ACLs are used.
- **Timezone:** `Asia/Tokyo`.

## Conventions for agents

- **Git:** Do not commit, amend, or push unless the user explicitly asks.
- **Nix apply:** Do not run rebuild/switch/test on the user’s system unless they explicitly ask. That includes `nh os switch`, `nh os test`, `nh home switch`, `nixos-rebuild switch`, `home-manager switch`, and similar. Document what they should run; let them apply it.
- **TODO.md:** Do not edit, append, or “clean up” — personal backlog only.
- **Scope:** Minimal diffs; match existing Nix/home-manager style in neighboring files.
- **Secrets:** Do not commit credentials; wallpaper flake uses private SSH input in `flake.nix`.
- **Still read files** for exact option names and imports; this doc replaces broad repo grep, not local verification.

## Human docs

- `README.md` — overview screenshot only.
- `TODO.md` — user-owned notes; agents must not modify.
