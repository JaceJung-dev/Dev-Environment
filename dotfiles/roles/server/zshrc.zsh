# 서버(맥미니) 전용 zsh 설정 — .zshrc 끝에서 source 된다.

# p10k: OS 아이콘(사과) 자리에 같은 색(밝은 회색 배경 + 검은 글씨, 볼드 없음)으로 호스트 이름을 항상 표시한다.
# (SSH 여부와 무관하게 표시 — 로컬에서 띄운 tmux 에 SSH 로 attach 하면 SSH_CONNECTION 이 없기 때문)
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context ${POWERLEVEL9K_LEFT_PROMPT_ELEMENTS:#(context|os_icon)})
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS:#context})
typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO,REMOTE,REMOTE_SUDO,ROOT}_FOREGROUND=232
typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO,REMOTE,REMOTE_SUDO,ROOT}_BACKGROUND=7
# 표시 이름: 호스트명에서 첫 '-' 앞부분을 뺀 것 (jwoong-macmini → macmini). ~/.zshrc.local 에서 덮어쓸 수 있다.
: ${DOTFILES_HOST_LABEL:=${${HOST%%.*}#*-}}
typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO,REMOTE,REMOTE_SUDO,ROOT}_CONTENT_EXPANSION='${DOTFILES_HOST_LABEL}'
typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO,REMOTE,REMOTE_SUDO,ROOT}_VISUAL_IDENTIFIER_EXPANSION='󰒋'
