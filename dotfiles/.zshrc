# ===============================
# 0. Minimal shell for VSCode CodeLLDB debug sessions
# ===============================
# Skip heavy init (oh-my-zsh, p10k, plugins) so the debug session starts cleanly.
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
    PS1='%n@%m %~ %# '
    setopt INTERACTIVE_COMMENTS
    return 0
fi

# ===============================
# 1. Tmux Auto Start
# ===============================
if command -v tmux &> /dev/null \
    && [ -z "$TMUX" ] \
    && [ -z "$SSH_CONNECTION" ] \
    && [[ $- == *i* ]]; then
    tmux attach-session -t default || tmux new-session -s default
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ===============================
# 1. Environment Variables
# ===============================

# Editor (for yazi)
export EDITOR="nvim"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

# PATH (tcl-tk, ruby, gem, jpeg)
export PATH="/opt/homebrew/opt/tcl-tk/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/jpeg/bin:$PATH"
export PATH="$HOME/.gem/ruby/3.4.4/bin:$PATH"

# Tcl/Tk
export LDFLAGS="-L/opt/homebrew/opt/tcl-tk/lib"
export CPPFLAGS="-I/opt/homebrew/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/tcl-tk/lib/pkgconfig"
export TCL_LIBRARY="/opt/homebrew/opt/tcl-tk/lib/tcl8.6"
export TK_LIBRARY="/opt/homebrew/opt/tcl-tk/lib/tk8.6"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

. "$HOME/.local/bin/env"

# ===============================
# 2. Completion System
# ===============================

# Docker CLI completions
fpath=(/Users/jwoong/.docker/completions $fpath)
autoload -Uz compinit
compinit

# uv
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
compdef _gnu_generic uv

# bun completions
[ -s "/Users/jwoong/.bun/_bun" ] && source "/Users/jwoong/.bun/_bun"

# Pixi (Conda replacement)
eval "$(pixi completion --shell zsh)"

# ===============================
# 3. Shell Integration & Init
# ===============================

# Pyenv
eval "$(pyenv init - zsh)"

# Zsh: always resolve to physical path (fixes case mismatch on macOS APFS)
setopt CHASE_LINKS

# Zoxide (better cd)
export _ZO_RESOLVE_SYMLINKS=1  # store real path in DB (fixes case mismatch on macOS APFS)
eval "$(zoxide init zsh)"

# Thefuck
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# Yazi (file manager)
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# ===============================
# 4. Aliases
# ===============================

# zoxide
alias cd="z"

# Python
alias py_venv="python3 -m venv venv"
alias py_source="source venv/bin/activate"
alias uv_venv="uv venv .venv"
alias uv_source="source .venv/bin/activate"
alias lintfix="black . && isort . && flake8"

# eza (better ls)
# alias ls="eza --icons=always"
# alias la="eza --icons=always --long --git -a"
# alias lt="eza --icons=always --tree --level=2"

function ls {
  if [ -t 1 ]; then
    command eza --icons=always "$@"
  else
    /bin/ls "$@"
  fi
}

function la {
  if [ -t 1 ]; then
    command eza --icons=always --long --git -a "$@"
  else
    /bin/ls -la "$@"
  fi
}

function lt {
  if [ -t 1 ]; then
    command eza --icons=always --tree --level=2 "$@"
  else
    /bin/ls -R "$@"
  fi
}

unalias ls la lt 2>/dev/null

# valgrind
alias vg='valgrind --leak-check=yes --suppressions=$HOME/.valgrind/macos.supp'

# ===============================
# 5. fzf
# ===============================

# key bindings and fuzzy completion
source <(fzf --zsh)

# --- catppuccin macchiato theme ---
bg="#24273a"
bg_highlight="#363a4f"
fg="#cad3f5"
red="#ed8796"
mauve="#c6a0f6"
rosewater="#f4dbd6"
lavender="#b7bdf8"

export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --strip-cwd-prefix --exclude .git --color=always"
export FZF_DEFAULT_OPTS="--ansi \
  --color=fg:${fg},bg:${bg},hl:${red} \
  --color=fg+:${fg},bg+:${bg_highlight},hl+:${red} \
  --color=info:${mauve},prompt:${mauve},pointer:${rosewater} \
  --color=marker:${lavender},spinner:${rosewater},header:${red}"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type directory --follow --hidden --strip-cwd-prefix --exclude .git --color=always"

_fzf_compgen_path() {
  fd --follow --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --follow --hidden --exclude .git . "$1"
}

# --- preview ---
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# fzf-git integration
source ~/fzf-git.sh/fzf-git.sh

# ===============================
# 6. Tool Themes
# ===============================

# Bat (better cat)
export BAT_THEME="Catppuccin Macchiato"



# Added by Antigravity CLI installer
export PATH="/Users/jwoong/.local/bin:$PATH"
