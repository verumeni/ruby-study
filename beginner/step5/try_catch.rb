module TryCatch
    module_function

    def exception(err)
        begin
            if !err
                puts "no err"
            else
                raise "Err!"
            end
        rescue => ex
            puts "ex: #{ex}"
        ensure
            puts "finally"
        end
    end
end

TryCatch.exception(false)
TryCatch.exception(true)