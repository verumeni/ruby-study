class User
    @@count = 0

    def self.count
        @@count
    end

    # class method (特異メソッド)
    def self.describe_self
        # selfはクラスそのものを指す
        puts "[class method] self = #{self}"
    end

    # これもclass method
    class << self
        def hello
            "hello!"
        end
    end

    def initialize(name)
        @name = name
        @@count += 1
    end

    def name
        @name
    end

    # instance method
    def describe_self
        # selfはインスタンスを指す
        puts "[instance method] self = #{self}"
    end
end

User.describe_self
u1 = User.new("Taro")
u2 = User.new("Hanako")

puts User.hello

p u1.class
# 特異クラス 同じクラスから作成されたインスタンスでもobject_idが異なる
p u1.singleton_class
p u2.singleton_class

# 特異クラスのみに属する特異メソッド
def u1.ext_hello
    "u1 hello!"
end

# instance methods
p u1.class.instance_methods(false)
# singleton methods (特異メソッド)
p u1.singleton_methods(false)
p User.singleton_methods(false)

u1.describe_self
puts "count = #{User.count}"
puts "u1.name = #{u1.name}"
puts "u2.name = #{u2.name}"

# classネスト
class Parent

    def self.call
        "parent!"
    end

    class Child
        def self.call
            "child!"
        end
    end
end

# class methodを参照する際は.を使用
puts Parent.call
# class内のclassを参照する際は::を使用(主に定数・名前空間参照の時に使用)
puts Parent::Child.call