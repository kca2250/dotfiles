---
name: second-opinion
description: GitHub Copilotにセカンドオピニオンを求め、自身の見解と比較する。
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
argument-hint: "[対象ファイル or 質問内容]"
---

# セカンドオピニオン

指定された対象について GitHub Copilot に意見を求め、自身の見解と比較する。

対象: $ARGUMENTS

---

## 手順

### Step 1: 対象の把握

- 対象ファイル or 質問内容を確認する
- ファイルの場合は内容を読んで把握する

### Step 2: 自身の見解をまとめる

- 対象について自分なりの分析・レビュー結果を整理する
- まだユーザーには提示しない

### Step 3: GitHub Copilot に質問する

以下のコマンドで Copilot にセカンドオピニオンを求める:

```bash
gh copilot explain "$(cat <対象ファイルパス>)"
```

または質問ベースの場合:

```bash
gh copilot explain "<質問内容>"
```

### Step 4: 比較レポート

両方の見解を以下の形式でユーザーに提示する:

```markdown
## セカンドオピニオン結果

### Claude（自身の見解）
- ...

### GitHub Copilot の見解
- ...

### 共通点
- ...

### 相違点
| 観点 | Claude | Copilot |
|------|--------|---------|
| ... | ... | ... |

### 総合判断
- ...
```

---

## スコープ制御

### やること
- 対象への分析・レビュー
- 別モデルへの問い合わせと結果の比較
- 相違点の明確な提示

### やらないこと
- コードの修正（比較・報告のみ）
- どちらが正しいかの断定（判断はユーザーに委ねる）
