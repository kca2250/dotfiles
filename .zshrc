# ========================================
# 基本設定
# ========================================
export LANG=ja_JP.UTF-8
export EDITOR=vim

# ========================================
# ヒストリー設定
# ========================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history        # 複数ターミナルで履歴共有
setopt hist_ignore_dups     # 連続する重複コマンドは無視

# ========================================
# 補完設定
# ========================================
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # 大文字小文字区別しない

# ========================================
# プロンプト（Gitブランチ表示付き）
# ========================================
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b'
setopt prompt_subst

PROMPT='%F{cyan}%~%f %F{magenta}${vcs_info_msg_0_}%f
%F{green}❯%f '

# ========================================
# エイリアス
# ========================================
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -a'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# ========================================
# プラグイン
# ========================================
source ~/dotfiles/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
