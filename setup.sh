DOTFILES_DIR="$HOME/dotfiles"
ZSH_PLUGINS_DIR="$DOTFILES_DIR/zsh-plugins"

echo "=== dotfiles setup start ==="

# プラグインディレクトリ作成
mkdir -p "$ZSH_PLUGINS_DIR"

# zsh-syntax-highlighting
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
    echo "[install] zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting"
else
    echo "[skip] zsh-syntax-highlighting already exists"
fi

# zsh-autosuggestions
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-autosuggestions" ]; then
    echo "[install] zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_PLUGINS_DIR/zsh-autosuggestions"
else
    echo "[skip] zsh-autosuggestions already exists"
fi

# -----------------------------------------------------------------------------
# .zshrc のシンボリックリンク
# -----------------------------------------------------------------------------
if [ -f ~/.zshrc ] && [ ! -L ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.backup
    echo "[backup] .zshrc"
fi
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
echo "[done] .zshrc linked"

# -----------------------------------------------------------------------------
# nvim のシンボリックリンク
# -----------------------------------------------------------------------------
mkdir -p ~/.config
if [ -d ~/.config/nvim ] && [ ! -L ~/.config/nvim ]; then
    mv ~/.config/nvim ~/.config/nvim.backup
    echo "[backup] nvim config"
fi
ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim
echo "[done] nvim linked"


# -----------------------------------------------------------------------------
# ghostty のシンボリックリンク
# -----------------------------------------------------------------------------
GHOSTTY_CONFIG_DIR="$HOME/.config/ghostty"

# ghostty設定ディレクトリ作成
mkdir -p "$GHOSTTY_CONFIG_DIR"

# 既存のconfigファイルがあればバックアップ（シンボリックリンクでない場合のみ）
if [ -f "$GHOSTTY_CONFIG_DIR/config" ] && [ ! -L "$GHOSTTY_CONFIG_DIR/config" ]; then
    mv "$GHOSTTY_CONFIG_DIR/config" "$GHOSTTY_CONFIG_DIR/config.backup"
    echo "[backup] ghostty config"
fi

# dotfilesにghostty設定があるか確認
if [ -f "$DOTFILES_DIR/ghostty/config" ]; then
    ln -sf "$DOTFILES_DIR/ghostty/config" "$GHOSTTY_CONFIG_DIR/config"
    echo "[done] ghostty linked"
else
    echo "[warn] ghostty config not found in dotfiles, skipping..."
fi

# -----------------------------------------------------------------------------
# Git Hooks のシンボリックリンク
# -----------------------------------------------------------------------------
GIT_HOOKS_DIR="$HOME/.config/git/hooks"

mkdir -p "$GIT_HOOKS_DIR"

if [ -f "$DOTFILES_DIR/git-hooks/pre-commit" ]; then
    ln -sf "$DOTFILES_DIR/git-hooks/pre-commit" "$GIT_HOOKS_DIR/pre-commit"
    echo "[done] git pre-commit hook linked"
fi

if [ -f "$DOTFILES_DIR/git-hooks/pre-push" ]; then
    ln -sf "$DOTFILES_DIR/git-hooks/pre-push" "$GIT_HOOKS_DIR/pre-push"
    echo "[done] git pre-push hook linked"
fi

# -----------------------------------------------------------------------------
# gitignore_global のシンボリックリンク
# -----------------------------------------------------------------------------
GITIGNORE_GLOBAL="$HOME/.gitignore_global"

# 既存のファイルがあればバックアップ（シンボリックリンクでない場合のみ）
if [ -f "$GITIGNORE_GLOBAL" ] && [ ! -L "$GITIGNORE_GLOBAL" ]; then
    mv "$GITIGNORE_GLOBAL" "$GITIGNORE_GLOBAL.backup"
    echo "[backup] gitignore_global"
fi

# dotfilesにgitignore_globalがあるか確認
if [ -f "$DOTFILES_DIR/.gitignore_global" ]; then
    ln -sf "$DOTFILES_DIR/.gitignore_global" "$GITIGNORE_GLOBAL"
    echo "[done] gitignore_global linked"
else
    echo "[warn] gitignore_global not found in dotfiles, skipping..."
fi

# -----------------------------------------------------------------------------
# Claude Code のシンボリックリンク
# -----------------------------------------------------------------------------
CLAUDE_CONFIG_DIR="$HOME/.config/claude"

# Claude設定ディレクトリ作成
mkdir -p "$CLAUDE_CONFIG_DIR"

# commands ディレクトリのシンボリックリンク
if [ -d "$DOTFILES_DIR/claude/commands" ]; then
    ln -sf "$DOTFILES_DIR/claude/commands" "$CLAUDE_CONFIG_DIR/commands"
    echo "[done] claude commands linked"
fi

# settings.json のシンボリックリンク
if [ -f "$CLAUDE_CONFIG_DIR/settings.json" ] && [ ! -L "$CLAUDE_CONFIG_DIR/settings.json" ]; then
    mv "$CLAUDE_CONFIG_DIR/settings.json" "$CLAUDE_CONFIG_DIR/settings.json.backup"
    echo "[backup] claude settings.json"
fi

if [ -f "$DOTFILES_DIR/claude/settings.json" ]; then
    ln -sf "$DOTFILES_DIR/claude/settings.json" "$CLAUDE_CONFIG_DIR/settings.json"
    echo "[done] claude settings.json linked"
fi

# -----------------------------------------------------------------------------
# 完了メッセージ
# -----------------------------------------------------------------------------
echo ""
echo "=== setup complete! ==="
echo ""
echo "Run 'source ~/.zshrc' or restart terminal"
