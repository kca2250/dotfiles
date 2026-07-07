---
name: review-fe
description: React/Next.js のフロントエンドコードのレビューを頼まれたときに使用（ベストプラクティス準拠）
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
argument-hint: "[対象ファイル or 空欄で最近の変更]"
---

以下のコードをReact/Next.jsのベストプラクティスに基づいてレビューしてください: $ARGUMENTS

## レビュー観点

### 🔴 バグ・セキュリティ（必須）
- ロジックエラー、無限ループ、null/undefinedアクセス
- XSS脆弱性、dangerouslySetInnerHTMLの不適切な使用
- 機密情報のハードコード、環境変数の露出

### 🟡 Reactベストプラクティス
- コンポーネントの単一責任（大きすぎないか）
- 不要な再レンダリング（useCallback/useMemo/React.memo の適切な使用）
- useEffectの依存配列の正確性
- 状態のリフトアップ/コロケーション（適切な位置に状態があるか）
- key propの適切な設定（配列のindex使用を避ける）

### 🟡 Next.js ベストプラクティス
- Server Component / Client Componentの適切な選択
- 'use client' の必要性と配置
- next/image, next/link の活用
- データフェッチ戦略（SSG/SSR/ISR）の妥当性

### 🟢 コード品質
- DRY原則（重複コードがないか）
- 適切な型定義（any型の回避）
- エラーハンドリング（try-catch、Error Boundary）
- ローディング/エラー/空状態の考慮

## 指摘の前提

- 対象コードを実際に読んでから指摘する（ファイル名や差分からの推測で指摘しない）
- 各指摘に `file:line` を明記する
- 修正案は対象コードの実際のパターン（import・命名・書き方）に合わせる

## 出力形式

- 問題点のみ指摘（良いコードは褒めなくてOK）
- 重要度を明示（🔴高/🟡中/🟢低）
- 具体的な修正案をコード付きで提示
- 問題なければ「LGTM 🎉」のみ

## 指摘しないこと

- ESLint/Prettierで検出できるスタイルの問題
- 好みレベルの命名・構成の提案
- 過度な最適化の提案
