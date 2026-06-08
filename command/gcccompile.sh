#! /bin/zsh

# gcccompile
# --------------
# Description: This command can quickly compile c lang file with gcc

gcccompile() {
  if [[ -f "$1" ]]; then
    # 入力ファイル名から拡張子を除いたものに .out をつける
    local output="${1%.*}.out"
    gcc "$1" -o "$output"
    
    # コンパイル成功時のみメッセージを表示
    if [[ $? -eq 0 ]]; then
      echo "Compiled: $1 -> $output"
    fi
  else
    echo "Error: File '$1' not found."
  fi
}
