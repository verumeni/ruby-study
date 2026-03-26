# class
class Task

    # class variable
    @@count = 0
    def Task.count
        @@count
    end

    # accessor
    # read only
    attr_reader :id, :title
    # write read
    attr_accessor :done
    # write only
    #attr_writer

    # constructor
    def initialize(id:, title:, done: false)
        @id = id
        @title = title
        @done = done
    end

    # 状態を変更するメソッドを知らせるため末尾に!を付ける慣習がある
    def complete!
        @done = true
    end

    def increment
        @@count += 1
    end

    # return hash
    def to_h
        {id: @id, title: @title, done: @done}
    end

    # hash -> class (class method)
    # self はclass名に置き換えることも可能
    def self.from_h(hash)
        new(id: hash[:id], title: hash[:title], done: hash[:done])
    end
end

# task = Task.new(id: 1, title: "title")
# puts task.inspect
# puts "task => id: #{task.id}, title: #{task.title}, done: #{task.done}"

# task.complete!
# puts "to_h: #{task.to_h}"

# task2 = Task.from_h({id: 2, title: "abcd", done: false})
# puts "self.from_h: #{task2.inspect}"

# task.increment
# task2.increment
# puts "@@count: #{Task.count}"