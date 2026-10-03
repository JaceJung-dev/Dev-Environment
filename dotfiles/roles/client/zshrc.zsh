# 클라이언트(맥북) 전용 zsh 설정 — .zshrc 끝에서 source 된다.

# SSH 접속 중에는 터미널 배경색을 바꿔 원격임을 표시하고, 종료 시 원복한다.
# 로컬 tmux 안이면 해당 pane 스타일을, 아니면 OSC 11/111 로 터미널 배경을 바꾼다.
: ${DOTFILES_REMOTE_BG:='#212734'}

_dotfiles_bg_set() {
  if [[ -n $TMUX ]]; then
    tmux set -p -t "$TMUX_PANE" window-style "bg=$1" \; set -p -t "$TMUX_PANE" window-active-style "bg=$1"
  else
    printf '\e]11;%s\a' "$1"
  fi
}

_dotfiles_bg_reset() {
  if [[ -n $TMUX ]]; then
    tmux set -pu -t "$TMUX_PANE" window-style \; set -pu -t "$TMUX_PANE" window-active-style
  else
    printf '\e]111\a'
  fi
}

ssh() {
  # 파이프/스크립트에서는 색을 건드리지 않는다
  if [[ ! -t 1 ]]; then
    command ssh "$@"
    return
  fi
  _dotfiles_bg_set "$DOTFILES_REMOTE_BG"
  { command ssh "$@" } always { _dotfiles_bg_reset }
}
