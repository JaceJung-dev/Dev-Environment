# Dev Environment Setup

- 개인 개발 환경 설정 파일 모음

## 포함된 설정

- **Neovim** - LSP, auto-completion, treesitter 등 IDE 환경 설정
- **Zsh** - Oh My Zsh 기반 셸 환경 + CLI 도구 설정
- **WezTerm** - 모던 GPU 가속 터미널
- **Tmux** - 터미널 멀티플렉서
- **Aerospace** - 타일링 윈도우 매니저

## Neovim 설정

### 플러그인 매니저

- [lazy.nvim](https://github.com/folke/lazy.nvim)

### 주요 플러그인

| 카테고리 | 플러그인 |
|---------|---------|
| **LSP** | mason, nvim-lspconfig, mason-lspconfig |
| **자동완성** | nvim-cmp, LuaSnip, friendly-snippets |
| **파일 탐색** | nvim-tree, telescope, telescope-fzf-native |
| **Git** | gitsigns, lazygit |
| **포맷팅/린팅** | conform.nvim, nvim-lint |
| **UI** | lualine, bufferline, alpha, catppuccin, dressing |
| **코드** | treesitter, autopairs, nvim-surround, nvim-ts-autotag, todo-comments, trouble |
| **기타** | which-key, auto-session, vim-maximizer, render-markdown, indent-blankline |

### LSP 서버

| 서버 | 언어 |
|------|------|
| lua_ls | Lua |
| pyright | Python |
| clangd | C/C++ |
| ts_ls | JavaScript/TypeScript |
| html | HTML |
| cssls | CSS |
| tailwindcss | Tailwind CSS |
| ltex | 맞춤법/문법 검사 |

### 포맷터 / 린터

| 도구 | 역할 |
|------|------|
| prettierd | JS/TS/HTML/CSS/JSON/YAML/MD 포맷터 |
| isort + black | Python 포맷터 |
| clang-format | C/C++ 포맷터 |
| stylua | Lua 포맷터 |
| ruff | Python 린터 |
| eslint_d | JS/TS 린터 |
| cpplint | C/C++ 린터 |

## Zsh 설정

### Oh My Zsh

- 테마: Powerlevel10k
- 플러그인: `git`, `zsh-autosuggestions`, `zsh-syntax-highlighting`, `web-search`

### CLI 도구

| 도구 | 역할 | 대체 대상 |
|------|------|----------|
| [zoxide](https://github.com/ajeetdsouza/zoxide) | 스마트 디렉토리 이동 | `cd` |
| [eza](https://github.com/eza-community/eza) | 파일 목록 (아이콘, git 상태) | `ls` |
| [bat](https://github.com/sharkdp/bat) | 구문 강조 파일 출력 | `cat` |
| [fd](https://github.com/sharkdp/fd) | 빠른 파일 검색 | `find` |
| [fzf](https://github.com/junegunn/fzf) | 퍼지 파인더 | - |
| [delta](https://github.com/dandavella/delta) | Git diff 뷰어 | `diff` |
| [thefuck](https://github.com/nvbn/thefuck) | 오타 명령어 자동 교정 | - |

### fzf 설정

- **백엔드**: fd (파일 검색 + 디렉토리 검색)
- **테마**: Catppuccin Macchiato
- **프리뷰**: bat (파일), eza --tree (디렉토리)
- **통합**: [fzf-git.sh](https://github.com/junegunn/fzf-git.sh) (git 객체 퍼지 검색)

### Aliases

| Alias | 명령어 |
|-------|--------|
| `cd` | `z` (zoxide) |
| `ls` | `eza --icons=always` |
| `la` | `eza --icons=always --long --git -a` |
| `lt` | `eza --icons=always --tree --level=2` |
| `py_venv` | `python3 -m venv venv` |
| `uv_venv` | `uv venv .venv` |
| `lintfix` | `black . && isort . && flake8` |

### 환경 관리

| 도구 | 역할 |
|------|------|
| pyenv | Python 버전 관리 |
| NVM | Node.js 버전 관리 |
| bun | JavaScript 런타임/패키지 매니저 |
| uv | Python 패키지 매니저 |
| Pixi | Conda 대체 환경 관리 |

## 단축키

`<leader>` = `Space`, `<C->` = `Control`, `<CR>` = `Enter`

### 기본

| 키맵 | 동작 |
|------|------|
| `jk` | ESC (insert mode) |
| `<leader>nh` | 검색 하이라이트 제거 |
| `<leader>+` / `<leader>-` | 숫자 증가/감소 |

### 윈도우/탭

| 키맵 | 동작 |
|------|------|
| `<leader>sv` | 수직 분할 |
| `<leader>sh` | 수평 분할 |
| `<leader>se` | 분할 크기 동일하게 |
| `<leader>sx` | 현재 분할 닫기 |
| `<leader>sm` | 분할창 최대화/복원 |
| `<leader>to` | 새 탭 |
| `<leader>tx` | 탭 닫기 |
| `<leader>tn` / `<leader>tp` | 다음/이전 탭 |
| `<leader>tf` | 현재 버퍼를 새 탭으로 |

### 파일 탐색

| 키맵 | 동작 |
|------|------|
| `<leader>ee` | 파일 탐색기 토글 |
| `<leader>ef` | 현재 파일 위치로 탐색기 토글 |
| `<leader>ec` | 탐색기 전체 접기 |
| `<leader>er` | 탐색기 새로고침 |

### Telescope 검색

| 키맵 | 동작 |
|------|------|
| `<leader>ff` | 파일 찾기 |
| `<leader>fr` | 최근 파일 |
| `<leader>fs` | 문자열 검색 (live grep) |
| `<leader>fc` | 커서 아래 문자열 검색 |
| `<leader>ft` | Todo 검색 |

### LSP

| 키맵 | 동작 |
|------|------|
| `gR` | 참조 목록 |
| `gD` | 선언으로 이동 |
| `gd` | 정의로 이동 |
| `gi` | 구현 목록 |
| `gt` | 타입 정의 |
| `K` | 커서 아래 문서 보기 |
| `<leader>ca` | 코드 액션 |
| `<leader>rn` | 이름 변경 |
| `<leader>D` | 버퍼 전체 진단 |
| `<leader>d` | 현재 줄 진단 (float) |
| `[d` / `]d` | 이전/다음 진단 |
| `<leader>rs` | LSP 재시작 |

### Git

| 키맵 | 동작 |
|------|------|
| `<leader>gg` | LazyGit 열기 |
| `]h` / `[h` | 다음/이전 hunk |
| `<leader>hs` | hunk 스테이징 |
| `<leader>hr` | hunk 리셋 |
| `<leader>hu` | 스테이징 취소 |
| `<leader>hS` / `<leader>hR` | 파일 전체 stage/reset |
| `<leader>hp` | hunk 미리보기 |
| `<leader>hb` | 줄 blame |
| `<leader>hB` | inline blame 토글 |
| `<leader>hd` | 파일 diff |

### Trouble 진단

| 키맵 | 동작 |
|------|------|
| `<leader>xw` | 워크스페이스 진단 |
| `<leader>xd` | 현재 파일 진단 |
| `<leader>xq` | quickfix 목록 |
| `<leader>xl` | location 목록 |
| `<leader>xt` | Todo 목록 |

### 포맷팅/린팅

| 키맵 | 동작 |
|------|------|
| `<leader>mp` | 수동 포맷 |
| `<leader>l` | 수동 린트 |

### 세션

| 키맵 | 동작 |
|------|------|
| `<leader>ww` | 세션 검색 |
| `<leader>wr` | 세션 복원 |
| `<leader>ws` | 세션 저장 |

### Todo

| 키맵 | 동작 |
|------|------|
| `]t` / `[t` | 다음/이전 todo |

### 자동완성 (insert mode)

| 키맵 | 동작 |
|------|------|
| `<C-k>` / `<C-j>` | 이전/다음 항목 |
| `<C-b>` / `<C-f>` | 문서 스크롤 |
| `<C-Space>` | 자동완성 트리거 |
| `<C-e>` | 자동완성 닫기 |
| `<CR>` | 선택 확정 |

### Surround

| 키맵 | 동작 | 예시 |
|------|------|------|
| `ys{motion}{char}` | 감싸기 | `ysiw"` → hello → `"hello"` |
| `cs{old}{new}` | 변경 | `cs"'` → `"hello"` → `'hello'` |
| `ds{char}` | 삭제 | `ds"` → `"hello"` → `hello` |
| `yss{char}` | 줄 전체 감싸기 | `yss)` → 줄 전체를 `()` 로 |
| `S{char}` | visual 모드에서 감싸기 | 선택 후 `S"` |

## 빠른 설치

```bash
# 레포 클론
git clone https://github.com/JaceJung-dev/Dev-Envionment.git ~/dev_env

cd ~/dev_env

# 심볼릭 링크 생성
ln -s ~/dev_env/.config/nvim ~/.config/nvim
ln -s ~/dev_env/.config/aerospace ~/.config/aerospace
ln -s ~/dev_env/dotfiles/.zshrc ~/.zshrc
ln -s ~/dev_env/dotfiles/.wezterm.lua ~/.wezterm.lua
ln -s ~/dev_env/dotfiles/.tmux.conf ~/.tmux.conf

# lazygit 설치 (macOS)
brew install lazygit
```

## Credits

이 설정은 [Josean Martinez](https://github.com/josean-dev)의 [dev-environment-files](https://github.com/josean-dev/dev-environment-files)을 기반으로 개인 취향에 맞게 커스터마이징했습니다.
