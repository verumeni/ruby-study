# Ruby学習ロードマップ 初級編

## 対象読者と前提スキル
- Rubyの知識がない学習者を対象とする。
- C#でのWebアプリ開発経験、Node.js / TypeScript / Next.jsの経験を活かして学ぶ。
- 既存経験を活かしつつ、Ruby独自の書き方と考え方に慣れることを重視する。

## 学習ゴール
- Rubyの基礎文法と標準的な開発フローを理解する。
- オブジェクト指向、例外処理、コレクション操作をRubyらしく書けるようにする。
- テストを含む小さなCLIアプリを自力で作成できる状態になる。

## 学習ステップ
### Step 1: Ruby導入と基本文法
- 実行環境、`irb`、基本的な文法を確認する。
- 変数、数値、文字列、式、比較演算子を学ぶ。
- ハンズオン:
 - `ruby -v`
 - `gem -v`
 - `bundle -v`
 - `irb` シェル実行
- 小演習: 文字列連結や数値計算のミニスクリプトを作る。
 - `hello.rb` hello world出力
 - `variables.rb` 変数の扱い
 - `string_number.rb` 数値計算 文字列 比較

### Step 2: 制御構文とデータ構造
- `if/unless`、`case`、`while/until`、`each`を理解する。
- 配列とハッシュの基本操作を身につける。
- 小演習: 配列加工、ハッシュ集計、条件分岐の練習問題を解く。
 - `conditionals.rb` `if/unless/case when`
 - `loops.rb` ループ
 - `array_hash.rb` 配列/hashリスト
 - `practice_score_summary.rb` 演習

### Step 3: メソッドとブロック
- メソッド定義、引数、戻り値、キーワード引数を学ぶ。
- ブロック、`yield`、`map/select/reduce`の使い方を習得する。
- 小演習: 配列データを変換・抽出する処理を関数化する。
 - `methods_basic.rb` メソッドに関する基礎知識
 - `methods_args.rb` メソッド引数に関する基礎知識
 - `blocks_yield.rb` ブロック付メソッドの基礎知識(yield)
 - `enumerable_practice.rb` 演習

### Step 4: クラスとモジュール
- クラス、インスタンス、アクセサ、初期化を学ぶ。
- モジュール、mix-in、責務分離の考え方を理解する。
- 小演習: シンプルなToDo管理のドメインモデルを作る。
 - `task.rb` クラスに関する基礎知識
 - `task_repository.rb` ファイルの書き込み、読取
 - `task_cli.rb` CLIアプリの実行プログラム
 - `mix_in.rb` mix_in実装

### Step 5: 例外処理とファイルI/O
- `begin/rescue/ensure` による例外処理を学ぶ。
- ファイル読み書き、JSON/YAMLの入出力を扱う。
- 小演習: 入力ファイルを読み込み集計するCLIを作る。
 - `try_catch.rb` try~catch実装
 - `safe_file_reader.rb` ファイルアクセス
 - `json_store.rb` jsonファイルへの書込読取
 - `error_handling_demo.rb` 検証実行用ファイル

### Step 6: 依存管理とテスト入門
- BundlerとGemの基本を理解する。
- MinitestまたはRSpecで単体テストを書く。
- 小演習: 既存CLIにテストを追加し、失敗ケースも検証する。
 - `test_json_store.rb` テストコード(assert_equal)

### Step 7: 小規模プロジェクト実装
- これまでの内容を使って小さな実用CLIを1本実装する。
- 要件定義、実装、テスト、README記述まで一通り行う。
- 例: 家計簿集計ツール、ログ集計ツール、Markdown変換ツール。
 - `expense.rb` Entity
 - `expense_repository.rb` データの取得と永続化(jsonファイルを利用)
 - `expense_service.rb` サービスクラス、主にアプリからモデルを取得したり保存したりの中間的な役割
 - `cli.rb` CLIアプリの実行プログラム
 - `main.rb` メインファイル(起動用)
 - `test_expense_service.rb` test code

### Step 8: おまけ
- CLIコマンドのみで動作

## 次フェーズ予告（中級編・実践編）
- 中級編では、Rubyの設計パターン、メタプログラミング基礎、パフォーマンス観点を扱う。
- 実践編では、Rails導入、Webアプリ構成、認証・DB・テスト戦略を扱う。
- 今後は `docs` 配下にレベル別のロードマップを順次追加する。
