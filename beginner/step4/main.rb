# ライブラリ読み込み 読み込んだファイルは１行目から実行される
# require => 標準ライブラリやgemを読み込む際に使用
# require_relative => 今のファイル位置を基準に相対パスで読み込み, 自作ファイルを読み込むときに使用
require_relative "task_cli"

TaskCLI.run