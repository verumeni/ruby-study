# module mix_in機能の実装
# module functionをclassのインスタンスmethodとして実装
module Logger
    def log(message)
        puts "[LOG] #{message}"
    end

    module_function
end

class UserService
    include Logger

    def create_user(name)
        log("create_user called: #{name}")

        "User<#{name}> created"
    end
end

service = UserService.new
puts service.create_user("Taro")