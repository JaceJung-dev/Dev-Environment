#!/usr/bin/env bash
# dotfiles 설치: 역할을 기록하고 홈 디렉토리에 심볼릭 링크를 만든다.
# 사용법: ./install.sh [client|server]   (생략 시 기존 ~/.dotfiles-role 사용)
#   client - 맥북 등 SSH 로 접속하는 쪽
#   server - 맥미니 등 SSH 로 접속받는 쪽
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROLE="${1:-$(cat ~/.dotfiles-role 2>/dev/null || true)}"

case "$ROLE" in
  client | server) ;;
  *)
    echo "usage: $0 client|server" >&2
    exit 1
    ;;
esac
echo "$ROLE" >~/.dotfiles-role
echo "role: $ROLE"

# 이미 있는 심볼릭 링크는 교체하고, 실제 파일/디렉토리는 백업 후 교체한다.
link() {
  local src=$1 dst=$2
  if [[ -L "$dst" ]]; then
    rm "$dst"
  elif [[ -e "$dst" ]]; then
    local backup="$dst.backup.$(date +%Y%m%d%H%M%S)"
    mv "$dst" "$backup"
    echo "backup: $dst -> $backup"
  fi
  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  echo "link: $dst -> $src"
}

link "$REPO" "$HOME/.dotfiles"

for f in .zshrc .p10k.zsh .tmux.conf .wezterm.lua .hammerspoon; do
  link "$REPO/dotfiles/$f" "$HOME/$f"
done

for d in aerospace bat ghostty karabiner nvim yazi; do
  link "$REPO/.config/$d" "$HOME/.config/$d"
done

# tmux plugin manager
if [[ ! -d ~/.tmux/plugins/tpm ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  echo "tpm 설치 완료: tmux 안에서 prefix + I 로 플러그인을 설치하세요."
fi
