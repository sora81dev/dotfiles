#!/usr/bin/env bash

# Ref: 一目惚れから始まった。NixOSに最高の美しさをもたらす「Nix + Noctalia」環境の作り方
#      https://note.com/joyful_fish3892/n/n91b03393bb00#83807da1-7bed-45a8-b196-f22be8f2be17

set -euo pipefail

# 起動しているNiriセッションに対して、各名前付きワークスペースのインデックスを固定する
niri msg action move-workspace-to-index 1 --reference "1terminal"
niri msg action move-workspace-to-index 2 --reference "2browser"
niri msg action move-workspace-to-index 3 --reference "3memo"
niri msg action move-workspace-to-index 4 --reference "4file"
niri msg action move-workspace-to-index 5 --reference "5office"
niri msg action move-workspace-to-index 6 --reference "6"
niri msg action move-workspace-to-index 7 --reference "7"
niri msg action move-workspace-to-index 8 --reference "8"
niri msg action move-workspace-to-index 9 --reference "9"
