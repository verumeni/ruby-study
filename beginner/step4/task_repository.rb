require "json"
require_relative "task"

# file操作
class TaskRepository
    def initialize(path = "step4/tasks.json")
        @path = path
    end

    def all
        return [] unless File.exist?(@path)
        JSON.parse(File.read(@path), symbolize_names: true).map {|h| Task.from_h(h)}
    end

    def save_all(tasks)
        data = tasks.map(&:to_h) # &:to_h => {|task| task.to_h} の短縮記法
        File.write(@path, JSON.pretty_generate(data))
    end
end

# rep = TaskRepository.new
# task = Task.new(id: 1, title: "title")
# puts "task: #{task.to_h}"
# rep.save_all([task])

# rep.all.each do |t|
#     puts "t: #{t}"
# end