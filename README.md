# Dev Environment Setup

- 개인 개발 환경 설정 파일 모음

## 포함된 설정

- **Neovim** - LSP, auto-completion, treesitter 등 IDE 환경 설정
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
| **코드** | treesitter, autopairs, nvim-ts-autotag, todo-comments, trouble |
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

## 빠른 설치

```bash
# 레포 클론
git clone https://github.com/JaceJung-dev/Dev-Envionment.git ~/dev_env

cd ~/dev_env

# 심볼릭 링크 생성
ln -s ~/dev_env/.config/nvim ~/.config/nvim
ln -s ~/dev_env/.config/aerospace ~/.config/aerospace
ln -s ~/dev_env/dotfiles/.wezterm.lua ~/.wezterm.lua
ln -s ~/dev_env/dotfiles/.tmux.conf ~/.tmux.conf

# lazygit 설치 (macOS)
brew install lazygit
```

## Credits

이 설정은 [Josean Martinez](https://github.com/josean-dev)의 [dev-environment-files](https://github.com/josean-dev/dev-environment-files)을 기반으로 개인 취향에 맞게 커스터마이징했습니다.
