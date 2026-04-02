# Ruby学習ロードマップ 中級編

## 対象読者と前提
- 初級編を完了し、Rubyの基本文法・OOP・例外処理・テスト基礎を一通り実装できる学習者
- CLIアプリを作りながら、設計・品質・性能の観点を実務レベルに近づけたい人

## 学習ゴール
- Rubyの設計力と保守性を高める
- テストしやすい実装と依存管理を定着させる
- メタプログラミングを安全に使える基礎を持つ
- パフォーマンスを計測し、改善を説明できる

## 学習ステップ

### STEP1: Rubyオブジェクトモデル再理解
- `self`、クラスメソッド、特異メソッド(シングルトンメソッド... staticなメソッド)の挙動を整理する
- `Module`、`include`、`extend` の違いを使い分ける
- 命名・可視性（`public/private/protected`）の方針を明確化する
- `self_and_methods.rb` クラスメソッド,インスタンスメソッド,特異メソッド,特異クラスについて
- `include_extend.rb` moduleのmix_in利用
- `visibility.rb` protected, private

### STEP2: 設計力強化（Plan Old Ruby Object PORO設計）
- PORO設計... フレームワークに依存せずに純粋なRubyクラスのみを使った設計
- サービスオブジェクト中心に責務を分離する
- 依存注入でテストしやすい構造を作る
- 例外の責務と rescue 範囲を適切に設計する
- `order.rb` entity, model
- `order_repository.rb` repository
- `discount_policy.rb` ビジネスロジック(値引き仕様)
- `order_service.rb` service
- `main.rb`

### STEP3: テスト実践（RSpec中心）
- RSpecとはRuby向けのテストフレームワーク(minitestと呼ばれるRailsデフォルトのものもあるがこちらの方が多数派)
- RSpecで単体テストを構築する
- モック/スタブ/テストダブルを適切に使う
- 境界値テストと異常系テストを増やす
- SimpleCovでカバレッジを確認する
- `spec_test.rb` RSpecの基礎知識
- `order_service_spec.rb` order_serviceクラスを使用したテストコード
- ハンズオン:
 - `bundle exec rspec --init` .rspec, spec_helper.rbファイル作成(既に存在する場合は不要)
 - `bundle exec rspec step3/spec_test.rb` テスト実行

### STEP4: 永続化とデータアクセス
- SQLite + ActiveRecord（またはSequel）で永続化を実装する
- ActiveRecord... rubyで使用されるORMライブラリ
- トランザクションの使いどころを理解する
- クエリ設計とバリデーション責務を分離する
- `order_record.rb` ActiveRecordを使用した
- `order_repository.rb` ActiveRecordの基礎的な操作
- `db_setup.rb` dbにテーブルを追加
- `main.rb`

### おまけSTEP: Proc基礎（STEP5の前）
- Procとlambdaの違い（引数チェック、`return` の挙動）を理解する
- `Proc.new`、`->`、`call`、`&` の書き方を練習する
- コールバックとしてProcを受け取るメソッドを実装する
- `map/select/reduce` とProcを組み合わせて再利用可能な処理を作る
- `proc_vs_lambda.rb` Procとlambdaの違い
- `proc_call_and_ampersand.rb` Proc(lambda)をブロック展開
- `callback_with_proc.rb` Procをcallbackとして受け取る
- `reusable_filters.rb` コレクション操作とProcの組み合わせ

### STEP5: CLI実践拡張
- `OptionParser` でコマンドライン引数を設計する
- サブコマンド構成（例: `add/list/report/import`）を整理する
- ログ、終了コード、エラーメッセージを統一する

### STEP6: メタプログラミング基礎（追加）
- `define_method` で動的メソッド定義を実装する
- `send/public_send` の違いを理解して使い分ける
- `method_missing` と `respond_to_missing?` をセットで扱う
- 小規模なDSL風APIを1つ作成し、可読性とのトレードオフを検証する

### STEP7: パフォーマンス改善演習（追加）
- `Benchmark` / `Benchmark.ips` で処理時間を計測する
- 全件読み込みとストリーム処理を比較する
- 配列変換チェーンと単一走査を比較する
- DBアクセスの改善（N+1回避、必要カラム取得）を行う
- 改善前後の計測結果を記録する

### STEP8: 中級総合プロジェクト
- 中規模CLIアプリを1本完成させる
- 要件: 設計分離、テスト、永続化、性能改善、ドキュメントを含む
- READMEで「設計判断」「例外戦略」「性能改善結果」を説明する

## 学習チェックリスト
- 設計: 各クラス/モジュールの責務を説明できる
- テスト: 正常系・異常系・境界値を網羅できる
- 永続化: DBアクセスとアプリロジックを分離できる
- Proc: Proc/lambdaを用途で使い分け、コールバックを実装できる
- メタプロ: 利便性と可読性のバランスを意識して使える
- 性能: 計測値に基づいて改善提案・実装ができる

## 中級編終了時の到達基準
- 中規模CLIを設計から実装・テスト・改善まで完了できる
- メタプログラミングを必要最小限で安全に使える
- パフォーマンス課題を計測し、改善を根拠付きで説明できる
- READMEのみで第三者が実行・検証できる状態を作れる
