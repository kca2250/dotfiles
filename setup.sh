#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
ZSH_PLUGINS_DIR="$DOTFILES_DIR/zsh-plugins"

echo "=== dotfiles setup start ==="

# プラグインディレクトリ作成
mkdir -p "$ZSH_PLUGINS_DIR"

# zsh-syntax-highlighting
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
    echo "[install] zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting"
fi

# zsh-autosuggestions
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-autosuggestions" ]; then
    echo "[install] zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_PLUGINS_DIR/zsh-autosuggestions"
fi

# .zshrcのシンボリックリンク
if [ -f ~/.zshrc ] && [ ! -L ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.backup
    echo "[backup] .zshrc"
fi
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
echo "[done] .zshrc linked"

echo "=== setup complete! ==="
echo "Run 'source ~/.zshrc' or restart terminal"
