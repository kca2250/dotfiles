#!/bin/bash
# PreToolUse(Bash) hook: 保護ブランチ(main/master/develop)へのgit commitをブロックする
# stdin: {"tool_name":"Bash","tool_input":{"command":"..."},"cwd":"..."} 形式のJSON
input=$(cat)
cmd=$(printf '%s' "$input" | jq -r '.tool_input.command // ""')

# git commit を含まないコマンドは対象外（git -C <path> commit / git -c k=v commit / git --no-pager commit にも対応）
printf '%s' "$cmd" | grep -qE '(^|[[:space:];&|(])git([[:space:]]+(-C[[:space:]]+[^[:space:]]+|-c[[:space:]]+[^[:space:]]+|--[a-z-]+))*[[:space:]]+commit([[:space:]]|$)' || exit 0

# -C オプションがあればそのディレクトリ、なければ実行時カレントディレクトリのブランチを確認
repo_dir=$(printf '%s' "$cmd" | sed -nE 's/.*git[[:space:]]+-C[[:space:]]+"?([^"[:space:]]+)"?.*/\1/p' | head -1)
if [ -z "$repo_dir" ]; then
  repo_dir=$(printf '%s' "$input" | jq -r '.cwd // empty')
fi
[ -z "$repo_dir" ] && repo_dir="."
repo_dir="${repo_dir/#\~/$HOME}"

branch=$(git -C "$repo_dir" branch --show-current 2>/dev/null)
case "$branch" in
  main|master|develop)
    echo "⚠️ 保護ブランチ（${branch}）への直接コミットは禁止されています。作業用ブランチを作成してください（例: git switch -c feature/xxx）" >&2
    exit 2
    ;;
esac
exit 0
