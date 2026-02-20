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

# GitHub PR系
alias prl="gh pr list"
alias prv="gh pr view --web"
alias prst="gh pr status"
alias prdiff="gh pr diff"

# GitHub Issue系
alias issl="gh issue list"
alias issv="gh issue view --web"
# ========================================
# プラグイン
# ========================================
if [ -f ~/dotfiles/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/dotfiles/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -f ~/dotfiles/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ~/dotfiles/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# ========================================
# PATH設定（OS別）
# ========================================
export PATH="$HOME/.local/bin:$PATH"

# Mac専用
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="$HOME/.volta/bin:$PATH"
fi

# ========================================
# カスタムコマンド
# ========================================

# cd をしたときにlsを実行する
function chpwd() { ls -GvF }
