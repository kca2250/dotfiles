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
# wezterm のシンボリックリンク
# -----------------------------------------------------------------------------
if [ -f ~/.wezterm.lua ] && [ ! -L ~/.wezterm.lua ]; then
    mv ~/.wezterm.lua ~/.wezterm.lua.backup
    echo "[backup] .wezterm.lua"
fi
ln -sf "$DOTFILES_DIR/wezterm/wezterm.lua" ~/.wezterm.lua
echo "[done] wezterm linked"

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
# 完了メッセージ
# -----------------------------------------------------------------------------
echo ""
echo "=== setup complete! ==="
echo ""
echo "Run 'source ~/.zshrc' or restart terminal"
