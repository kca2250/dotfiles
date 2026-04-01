# GitHub Copilot prompts をプロジェクトにリンクするヘルパー関数
# Usage:
#   setup-copilot-prompts              # カレントディレクトリに配置
#   setup-copilot-prompts /path/to/project  # 指定ディレクトリに配置
setup-copilot-prompts() {
    local target_dir="${1:-.}/.github/prompts"
    local source_dir="$HOME/dotfiles/copilot/prompts"

    if [ ! -d "$source_dir" ]; then
        echo "[error] $source_dir not found"
        return 1
    fi

    mkdir -p "$target_dir"

    for file in "$source_dir"/*.prompt.md; do
        local filename=$(basename "$file")
        if [ -f "$target_dir/$filename" ] && [ ! -L "$target_dir/$filename" ]; then
            mv "$target_dir/$filename" "$target_dir/${filename}.backup"
            echo "  [backup] $filename"
        fi
        ln -sf "$file" "$target_dir/$filename"
        echo "  [linked] $filename"
    done

    echo "[done] copilot prompts linked to $target_dir"
}
