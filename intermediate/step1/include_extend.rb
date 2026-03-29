module Loggable
    def log(message)
        puts "[LOG] #{message}"
    end
end

class Service
    # mix in moduleで定義したinstance methodが利用可
    include Loggable
end

class ServiceB
    # class methodとして利用可
    extend Loggable
end

service = Service.new
service.log("Service instance method log")

ServiceB.log("ServiceB class method log")


