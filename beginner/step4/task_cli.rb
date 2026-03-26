require_relative "task"
require_relative "task_repository"

# module ユーティリティクラスのようなもの
module TaskCLI

    def run
        repo = TaskRepository.new
        tasks = repo.all

        loop do # loop => breakするまで無限ループ
            puts "\n=== Task CLI ==="
            puts "1) 一覧"
            puts "2) 追加"
            puts "3) 完了"
            puts "4) 終了"
            print "選択: "
            choice = gets&.chomp # gets => 入力１行読む, chomp => 末尾改行を削除, &. => セーフナビゲーション演算子 nilの時でも安全にchompを実行するため(typescriptの?と似た挙動)

            case choice
            when "1"
                show(tasks)
            when "2"
                add(tasks)
                repo.save_all(tasks)
            when "3"
                complete(tasks)
                repo.save_all(tasks)
            when "4"
                puts "終了します"
                break
            else
                puts "不正な入力です"
            end
        end
    end

    def show(tasks)
        if tasks.empty?
            puts "タスクはありません"
            return
        end

        tasks.each do |t|
            mark = t.done ? "x" : " "
            puts "[#{mark}] #{t.id}: #{t.title}"
        end
    end

    def add(tasks)
        print "タイトル:"
        title = gets&.chomp.to_s.strip
        return puts "空は不可" if title.empty?

        next_id = (tasks.map(&:id).max || 0) + 1
        tasks << Task.new(id: next_id, title: title)
        puts "追加しました"
    end

    def complete(tasks)
        print "完了するID:"
        id = gets&.chomp.to_i
        task = tasks.find {|t| t.id == id}
        return puts "見つかりません" unless task

        task.complete!
        puts "完了にしました"
    end

    # モジュール内メソッドを外部に提供するための宣言
    module_function :run, :show, :add, :complete
end