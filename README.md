# 🛠️ Dev Environment Setup

- 개인 개발 환경 설정 파일 모음

## 📦 포함된 설정

- **Neovim** - LSP, auto-completion, treesitter 등 IDE 환경 설정
- **WezTerm** - 모던 GPU 가속 터미널
- **Tmux** - 터미널 멀티플렉서

## ⚙️ Neovim 설정

### 플러그인 매니저

- [lazy.nvim](https://github.com/folke/lazy.nvim)

### 주요 플러그인

- **LSP**: Mason, nvim-lspconfig
- **자동완성**: nvim-cmp
- **파일 탐색**: nvim-tree, telescope
- **UI**: lualine, bufferline, alpha
- **코드**: treesitter, autopairs, auto-session
- **기타**: which-key, trouble, todo-comments

## 🚀 빠른 설치

```bash
# 레포 클론
git clone https://github.com/JaceJung-dev/Dev-Envionment.git ~/dev_env

cd ~/dev_env

# 심볼릭 링크 생성
ln -s ~/dev_env/.config/nvim ~/.config/nvim
ln -s ~/dev_env/dotfiles/.wezterm.lua ~/.wezterm.lua
ln -s ~/dev_env/dotfiles/.tmux.conf ~/.tmux.conf
```

## 🙏 Credits

이 설정은 [Josean Martinez](https://github.com/josean-dev)의 [dev-environment-files](https://github.com/josean-dev/dev-environment-files)을 기반으로 개인 취향에 맞게 커스터마이징했습니다.
